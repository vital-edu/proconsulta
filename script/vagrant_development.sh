clear

echo "Instalando RVM com Ruby 2.2.0"
echo
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2
source /usr/local/rvm/scripts/rvm

echo
echo "Instalando GIT"
echo
sudo apt-get install -y git

echo
echo "Clonando repositório"
echo
git clone https://gitlab.com/UNB-GPPMDS-2014/Proconsulta.git proconsulta
cd proconsulta
git checkout -t origin/rails4
echo

echo
echo "Instalando dependências do Proconsulta"
echo
sudo apt-get install -y libpq-dev postgresql-9.3 nodejs

echo
echo "Configurando PostgreSQL"
echo
export DB_USER="vagrant"
export DB_PASSWORD="vagrant"
sudo su - postgres bash -c "psql -c \"CREATE USER vagrant WITH CREATEDB PASSWORD 'vagrant';\""

echo
echo "Instalando gems necessárias"
echo
rm Gemfile.lock
bundle

echo
echo "Criando banco de dados e realizando migrações"
echo
rake db:create
rake db:migrate
