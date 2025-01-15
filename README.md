# Tom_CI-CD

## Prérequis

- **Docker** : Assurez-vous que Docker est installé et configuré.
- **Ansible** : Pour exécuter les playbooks Ansible et déployer les containers
- **Python** : Nécessaire pour exécuter les scripts Python inclus.

## Instructions

1. **Configurer l'environnement** :
   - Mettez à jour le fichier `inventory.cfg` avec vos hôtes cibles.
   - Configurez les variables nécessaires dans les playbooks Ansible.

2. **Lancer l'environnement** :
   - Utilisez `docker-compose` pour déployer l'application en exécutant :
     ```bash
     docker-compose up -d
     ansible all -i inventory.cfg
     ```

3. **Exécuter les playbooks Ansible** :
   - Pour tester la connectivité, exécutez :
     ```bash
     ansible-playbook -i inventory.cfg ping_playbook.yml
     ```
   - Pour configurer l'environnement, exécutez :
     ```bash
     ansible-playbook -i inventory.cfg setup_environment.yml
     ```
