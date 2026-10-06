from rest_framework import serializers
from django.contrib.auth import authenticate
from .models import Cadastro
# Importa a model FK
from permissoes.models import PerfilDePermissao 

class CadastroSerializer(serializers.ModelSerializer):
    # CORREÇÃO: Define o campo para o Perfil de Acesso (ÚNICO FK)
    perfil_permissao = serializers.PrimaryKeyRelatedField(
        queryset=PerfilDePermissao.objects.all(),
        required=True
    )
    
    class Meta:
        model = Cadastro 
        fields = [
            'id',
            'username',
            'email',
            'first_name',
            'last_name',
            'perfil_permissao', # Campo ÚNICO, substitui o antigo tipo_funcao
            'password'          # write_only
        ]

        extra_kwargs = {
            'password': {'write_only':True}
        }

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)

        if password:
            instance.set_password(password)

        instance.save()
        return instance


class LoginSerializer(serializers.Serializer):
    """Serializer para login de usuário"""
    email = serializers.EmailField()
    password = serializers.CharField(write_only=True, style={'input_type': 'password'})
    
    # NOVO CAMPO: Usado para retornar o nome do perfil para o frontend header
    perfil_nome = serializers.SerializerMethodField()

    # Método que pega o nome do FK (a string de Cargo/Permissão)
    def get_perfil_nome(self, obj):
        return obj.perfil_permissao.nome if obj.perfil_permissao else 'N/A'
    
    def validate(self, data):
        email = data.get('email')
        password = data.get('password')
        
        if email and password:
            try:
                user = Cadastro.objects.get(email=email)
                
                if user.check_password(password):
                    if not user.is_active:
                        raise serializers.ValidationError('Usuário desativado.')
                    
                    # CORREÇÃO CRÍTICA: Retorna o ID do FK e o objeto user
                    return {
                        'user': user,
                        'email': user.email,
                        'id': user.id,
                        'username': user.username,
                        'first_name': user.first_name,
                        'last_name': user.last_name,
                        'perfil_id': user.perfil_permissao_id, # ID para referência
                    }
                else:
                    raise serializers.ValidationError('Email ou senha incorretos.')
            except Cadastro.DoesNotExist:
                raise serializers.ValidationError('Email ou senha incorretos.')
        else:
            raise serializers.ValidationError('Email e senha são obrigatórios.')
        
        return data