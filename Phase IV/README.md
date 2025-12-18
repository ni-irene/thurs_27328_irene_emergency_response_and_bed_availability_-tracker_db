# Emergency Tracker Database - Phase IV

## Student Information
- **Group**: Thursday
- **Student ID**: 27328  
- **Name**: Igiraneza Irene
- **Project**: Emergency Response and bed availability Tracker System
- **Phase**: IV - Database Creation

## Database Details
- **PDB Name**: `THURS_27328_IRENE_EMERGENCYTRACKER_DB`
- **Admin User**: `pdb_admin`
- **Password**: `Irene`
- **Oracle Version**: 21c XE

## Scripts Included
| File | Purpose |
|------|---------|
| `create_pdb.sql` | Creates pluggable database and admin user |
| `tablespaces.sql` | Creates data, index, and temporary tablespaces |
| `configuration.sql` | Sets memory parameters (SGA/PGA) |
| `user_privileges.sql` | Grants DBA privileges to admin user |
| `verify_setup.sql` | Verification queries to confirm setup |

## Connection Details
- **Hostname**: `localhost`
- **Port**: `1521`
- **Service Name**: `thurs_27328_Irene_EmergencyTracker_Db`
- **Username**: `pdb_admin`
- **Password**: `Irene`

## Verification
Run `verify_setup.sql` to confirm:
1. PDB is open and accessible
2. Tablespaces created successfully
3. Admin user has correct privileges
4. Memory parameters configured


