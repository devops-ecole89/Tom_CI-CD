# Tom_CI-CD

## Prerequisites

- **Docker** : Ensure Docker is installed and properly configured.
- **Ansible** : Required to execute Ansible playbooks and deploy containers.
- **Python** : Necessary to run the included Python scripts.

## Instructions

1. **Set Up the Environment:** :
   - Update the `inventory.cfg` file with your target hosts.
   - Configure the required variables in the Ansible playbooks.

2. **Lancer l'environnement** :
   - Use `docker-compose` to deploy the application by running :
     ```bash
     docker-compose up -d
     ansible all -i inventory.cfg
     ```

3. **Run Ansible playbooks** :
   - To test connectivity, run :
     ```bash
     ansible-playbook -i inventory.cfg ping_playbook.yml
     ```
   - To configure the environment, run :
     ```bash
     ansible-playbook -i inventory.cfg setup_environment.yml
     ```
