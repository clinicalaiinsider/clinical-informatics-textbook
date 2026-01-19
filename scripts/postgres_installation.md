# PostgreSQL Installation Guide for OMOP CDM

This guide walks you through installing PostgreSQL and setting up the database environment needed to run the Clinical Informatics Textbook examples.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation by Operating System](#installation-by-operating-system)
3. [Post-Installation Configuration](#post-installation-configuration)
4. [Database Creation](#database-creation)
5. [Verification](#verification)
6. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### System Requirements

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| RAM | 4 GB | 8 GB |
| Disk Space | 5 GB | 10 GB |
| PostgreSQL Version | 13 | 15+ |

### Software Requirements

- Terminal/Command Line access
- Administrative privileges (for installation)
- Text editor (for editing configuration files)

---

## Installation by Operating System

### macOS

#### Option 1: Homebrew (Recommended)

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install PostgreSQL 15
brew install postgresql@15

# Start PostgreSQL service
brew services start postgresql@15

# Add to PATH (add this to your ~/.zshrc or ~/.bash_profile)
echo 'export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

#### Option 2: PostgreSQL.app

1. Download from [postgresapp.com](https://postgresapp.com/)
2. Move to Applications folder
3. Open and click "Initialize"
4. Add to PATH:
   ```bash
   sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
   ```

### Windows

#### Option 1: Official Installer (Recommended)

1. Download from [postgresql.org/download/windows](https://www.postgresql.org/download/windows/)
2. Run the installer
3. During installation:
   - Set a password for the `postgres` superuser
   - Keep default port `5432`
   - Select your locale
   - Install Stack Builder (optional)
4. Add to PATH:
   - Open System Properties → Environment Variables
   - Add `C:\Program Files\PostgreSQL\15\bin` to PATH

#### Option 2: Chocolatey

```powershell
# Install Chocolatey (run PowerShell as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install PostgreSQL
choco install postgresql15
```

### Linux

#### Ubuntu/Debian

```bash
# Update package list
sudo apt update

# Install PostgreSQL 15
sudo apt install postgresql-15 postgresql-client-15

# Start and enable service
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

#### RHEL/CentOS/Fedora

```bash
# Install PostgreSQL repository
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Install PostgreSQL 15
sudo dnf install -y postgresql15-server postgresql15

# Initialize database
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb

# Start and enable service
sudo systemctl start postgresql-15
sudo systemctl enable postgresql-15
```

---

## Post-Installation Configuration

### 1. Configure Authentication (pg_hba.conf)

Locate the `pg_hba.conf` file:
- macOS (Homebrew): `/opt/homebrew/var/postgresql@15/pg_hba.conf`
- Linux: `/etc/postgresql/15/main/pg_hba.conf`
- Windows: `C:\Program Files\PostgreSQL\15\data\pg_hba.conf`

For local development, ensure these lines are present:

```
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     trust
host    all             all             127.0.0.1/32            trust
host    all             all             ::1/128                 trust
```

After editing, restart PostgreSQL:

```bash
# macOS
brew services restart postgresql@15

# Linux
sudo systemctl restart postgresql

# Windows (PowerShell as Administrator)
Restart-Service postgresql-x64-15
```

### 2. Create Your User Role

```bash
# Connect as postgres superuser
sudo -u postgres psql

# Create your user with superuser privileges
CREATE USER your_username WITH SUPERUSER PASSWORD 'your_password';

# Exit psql
\q
```

Or use the command line:

```bash
# macOS/Linux
createuser -s $(whoami)

# Windows (use Command Prompt)
createuser -U postgres -s your_username
```

---

## Database Creation

### Create the OHDSI Learning Database

```bash
# Create the database
createdb ohdsi_learning

# Or if you need to specify a user
createdb -U postgres ohdsi_learning
```

### Create Required Schemas

Connect to the database and create the OMOP CDM schemas:

```bash
psql -d ohdsi_learning
```

```sql
-- Create schemas for OMOP CDM
CREATE SCHEMA IF NOT EXISTS cdm;
CREATE SCHEMA IF NOT EXISTS vocabulary;
CREATE SCHEMA IF NOT EXISTS results;

-- Set search path (optional, for convenience)
SET search_path TO cdm, vocabulary, results, public;

-- Verify schemas
\dn
```

Expected output:
```
       List of schemas
   Name    |    Owner
-----------+-------------
 cdm       | your_user
 public    | pg_database_owner
 results   | your_user
 vocabulary| your_user
```

---

## Verification

### Test Database Connection

```bash
# Connect to the database
psql -d ohdsi_learning -c "SELECT version();"
```

Expected output (example):
```
                                                     version
------------------------------------------------------------------------------------------------------------------
 PostgreSQL 15.4 (Homebrew) on aarch64-apple-darwin23.0.0, compiled by Apple clang version 15.0.0, 64-bit
```

### Verify Schemas Exist

```bash
psql -d ohdsi_learning -c "\dn"
```

### Test Write Permissions

```bash
psql -d ohdsi_learning -c "CREATE TABLE cdm.test_table (id INT); DROP TABLE cdm.test_table;"
```

If no errors, your setup is complete!

---

## Troubleshooting

### Common Issues

#### 1. "Connection refused"

**Cause:** PostgreSQL service is not running.

**Solution:**
```bash
# macOS
brew services start postgresql@15

# Linux
sudo systemctl start postgresql

# Windows
net start postgresql-x64-15
```

#### 2. "Role does not exist"

**Cause:** Your user doesn't exist in PostgreSQL.

**Solution:**
```bash
sudo -u postgres createuser -s $(whoami)
```

#### 3. "Database does not exist"

**Cause:** The `ohdsi_learning` database hasn't been created.

**Solution:**
```bash
createdb ohdsi_learning
```

#### 4. "Permission denied"

**Cause:** Your user lacks necessary privileges.

**Solution:**
```bash
sudo -u postgres psql -c "ALTER USER your_username WITH SUPERUSER;"
```

#### 5. "Port already in use"

**Cause:** Another PostgreSQL instance or application is using port 5432.

**Solution:**
```bash
# Find what's using the port
lsof -i :5432

# Either stop the other process or use a different port
# Edit postgresql.conf to change the port
```

### Getting Help

- **PostgreSQL Documentation:** [postgresql.org/docs](https://www.postgresql.org/docs/)
- **OHDSI Forums:** [forums.ohdsi.org](https://forums.ohdsi.org/)
- **Stack Overflow:** Tag questions with `postgresql` and `ohdsi`

---

## Next Steps

Once PostgreSQL is installed and configured:

1. **Load the Teaching Dataset:** Follow [data_setup.md](data_setup.md)
2. **Run Example Queries:** Execute scripts in `scripts/chapters/`
3. **Explore the Textbook:** Open `docs/CLINICAL-INFORMATICS-TEXTBOOK-ACADEMIC.md`

---

*Part of the Clinical Informatics Textbook - Teaching Dataset for OMOP CDM 5.4*
