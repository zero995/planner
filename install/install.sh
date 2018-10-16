#setup envioriment
dnf groupinstall "Development Tools" -y
dnf groupinstall "C Development Tools and Libraries" -y
dnf install mysql mysql-server mysql-devel -y
dnf install python-mysql python-pip python-virtualenv python-pymongo python-mysql -y
dnf install openssl libssl-devel -y