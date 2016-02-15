# mu-db 
**mu-db** is a simple music database web app using [Flask](http://flask.pocoo.org/). See the images below for a look:

<p align="center">
  <img src="http://i.imgur.com/7xpe91a.png" alt="mu-db splash screen"/>
  <img src="http://i.imgur.com/YJEaCL3.png" alt="albums page"/>
</p>

# Build Instructions

These instructions show how to build **mu-db** and its necessary dependencies under Ubuntu 14.04:

### Setting up Python:
**mu-db** requires **python3** and some other related packages. You can install the necessary packages with the following command:

```sh
sudo apt-get install python3 python3-pip libpq-dev python-dev
```

### Setting up PostgreSQL and the mu-db Database:

If you don't have PostgreSQL installed, check out the following [guide](http://www.techrepublic.com/blog/diy-it-guy/diy-a-postgresql-database-server-setup-anyone-can-handle/) on how to setup PostgreSQL.
Once you have PostgreSQL installed, run `psql` as the postgres user and enter in the following commands in the postgres prompt:
```
CREATE DATABASE "mu-db";
CREATE USER "yourusername"; GRANT ALL PRIVILEGES ON DATABASE "mu-db" TO "yourusername";
ALTER USER "yourusername" WITH ENCRYPTED PASSWORD 'yourpassword';
```
You may choose whatever you want for the **username** and **password**. Once finished, edit in the **username** and **password** you used in the following line in [dbconfig.py](db/dbconfig.py):
```python
SQLALCHEMY_DATABASE_URI = "postgresql://yourusername:yourpassword@localhost/mu-db"
```
Finally, run the SQL script to create the tables and populate them with data with the following command:
```sh
psql "mu-db" -f db/scripts/mu-db_create.sql
````

### Setting up the Virtual Environment & Dependencies:

It is recommended that you use **virtualenv** to keep **mu-db**'s dependencies contained to itself.

```sh
pip3 install virtualenv
```

Create the virtual environment folder that **mu-db** will be using with the following command:

```sh
virtualenv venv
```

To install **mu-db**'s dependencies, simply activate the virtual environment and enter:

```sh
pip3 install -r dependencies
```

For more information on how to use virtualenv (such as activating and deactivating), check out the following [link](http://docs.python-guide.org/en/latest/dev/virtualenvs/).

# Running mu-db

To run **mu-db**, activate the virtual environment and then run [mu-db.py](mu-db.py):
```sh
python3 mu-db.py
```
You can use the web app on localhost:5000 as configured in [mu-db.py](mu-db.py), or add in your own server to run it on. Have fun!


