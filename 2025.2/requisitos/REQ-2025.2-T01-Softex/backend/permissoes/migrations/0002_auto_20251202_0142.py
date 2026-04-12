# permissoes/migrations/0002_auto_xxxx.py

from django.db import migrations

def create_default_profiles(apps, schema_editor):
    """Cria os perfis de permissão essenciais alinhados às funções."""
    
    PerfilDePermissao = apps.get_model('permissoes', 'PerfilDePermissao')
    
    perfis_a_criar = [
        # ID 1: Colaborador Padrão (Default)
        {'id': 1, 'nome': 'Colaborador', 'descricao': 'Acesso básico e reservas.',
         'acessoBasico': True, 'dashboards': False, 'salasReuniao': False, 'administracao': False},
        # ID 2: TI (Admin Total)
        {'id': 2, 'nome': 'TI', 'descricao': 'Acesso total e configurações.',
         'acessoBasico': True, 'dashboards': True, 'salasReuniao': True, 'administracao': True},
        # ID 3: Financeiro
        {'id': 3, 'nome': 'Financeiro', 'descricao': 'Acesso básico e dashboards de relatórios.',
         'acessoBasico': True, 'dashboards': True, 'salasReuniao': False, 'administracao': False},
        # ID 4: Marketing
        {'id': 4, 'nome': 'Marketing', 'descricao': 'Acesso básico.',
         'acessoBasico': True, 'dashboards': False, 'salasReuniao': False, 'administracao': False},
        # ID 5: Jurídico
        {'id': 5, 'nome': 'Jurídico', 'descricao': 'Acesso básico.',
         'acessoBasico': True, 'dashboards': False, 'salasReuniao': False, 'administracao': False},
        # ID 6: Administrativo (Gestor)
        {'id': 6, 'nome': 'Administrativo', 'descricao': 'Acesso a dashboards e gestão de salas.',
         'acessoBasico': True, 'dashboards': True, 'salasReuniao': True, 'administracao': False},
        # ID 7: Projeto (Gestor)
        {'id': 7, 'nome': 'Projeto', 'descricao': 'Acesso a dashboards e gestão de salas.',
         'acessoBasico': True, 'dashboards': True, 'salasReuniao': True, 'administracao': False},
    ]

    for data in perfis_a_criar:
        # update_or_create garante que a migração não falhe se o dado já existir
        PerfilDePermissao.objects.update_or_create(
            pk=data['id'],
            defaults=data
        )

class Migration(migrations.Migration):

    dependencies = [
        # Certifique-se de que a dependência aponta para o seu 0001_initial
        ('permissoes', '0001_initial'), 
    ]

    operations = [
        migrations.RunPython(create_default_profiles, migrations.RunPython.noop),
    ]