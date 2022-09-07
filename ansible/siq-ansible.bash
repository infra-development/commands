vim inventory/mural02/group_vars/all/data-ingestion.yml # Change topic name
vim roles/service-iq/defaults/main.yml # Change presto-db name --> siq_presto_db_name
vim inventory/mural02/group_vars/all/service-iq.yml # Change --> siq_7stream_output_dir

--------- Install job --------------

/opt/mural/.venv_ansible/bin/ansible-playbook -i inventory/mural02 \
playbooks/data-ingestion/main.yml --extra-vars \
"@extra_vars.yml" --ask-pass --user guavus --become \
--become-method sudo --ask-vault-pass

devops2021
guavus123

/opt/mural/.venv_ansible/bin/ansible-playbook -i inventory/mural02 \
playbooks/service-iq/siq-pre-install-app.yml \
--extra-vars "@extra_vars.yml" --ask-pass --user guavus \
--become --become-method sudo --ask-vault-pass

/opt/mural/.venv_ansible/bin/ansible-playbook -i inventory/mural02 \
playbooks/service-iq/siq-7stream-app.yml \
--extra-vars "@extra_vars.yml" --ask-pass --user guavus \
--become --become-method sudo --ask-vault-pass

/opt/mural/.venv_ansible/bin/ansible-playbook -i inventory/mural02 \
playbooks/service-iq/siq-marketing-aggr-app.yml \
--extra-vars "@extra_vars.yml" --ask-pass --user guavus \
--become --become-method sudo --ask-vault-pass

---------------------- Uninstall jobs -------------------------------------------

/opt/mural/.venv_ansible/bin/ansible-playbook -i \
inventory/mural02 \
playbooks/data-ingestion/di-uninstall-apps.yml \
--extra-vars "@extra_vars.yml" --ask-pass --user guavus \
--become --become-method sudo --ask-vault-pass

/opt/mural/.venv_ansible/bin/ansible-playbook -i \
inventory/mural02 \
playbooks/service-iq/service-iq-uninstall-apps.yml \
--extra-vars "@extra_vars.yml" --ask-pass --user guavus \
--become --become-method sudo --ask-vault-pass

