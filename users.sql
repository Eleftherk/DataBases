# Create the Admin user
CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'AdminPassword';
GRANT ALL PRIVILEGES ON mobilityserviceproviderdb.* TO 'Admin'@'localhost';

# Create the CustomerService user
CREATE USER 'CustomerService'@'%' IDENTIFIED BY 'CustomerServicePassword';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.serve TO 'CustomerService'@'%';
GRANT SELECT, UPDATE ON mobilityserviceproviderdb.customer TO 'CustomerService'@'%';
GRANT SELECT ON mobilityserviceproviderdb.booking  TO 'CustomerService'@'%';
 
#Create the VehicleManager user
CREATE USER 'VehicleManager'@'%' IDENTIFIED BY 'VehicleManagerPassword';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.maintenance TO 'VehicleManager'@'%';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.vehicle TO 'VehicleManager'@'%';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.scooter TO 'VehicleManager'@'%';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.taxi TO 'VehicleManager'@'%';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.bicycle TO 'VehicleManager'@'%';
GRANT SELECT ON mobilityserviceproviderdb.Driver TO 'VehicleManager'@'%';

# Create the HRManager user
CREATE USER 'HRManager'@'%' IDENTIFIED BY 'HRManagerPassword';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.assistant TO 'HRManager'@'%';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.work TO 'HRManager'@'%';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.office TO 'HRManager'@'%';
GRANT SELECT, INSERT, UPDATE ON mobilityserviceproviderdb.driver TO 'HRManager'@'%';

# Create the LogisticManager user
CREATE USER 'LogisticManager'@'%' IDENTIFIED BY 'LogisticManagerPassword';
GRANT SELECT ON mobilityserviceproviderdb.assistant TO 'LogisticManager'@'%';
GRANT SELECT ON mobilityserviceproviderdb.booking TO 'LogisticManager'@'%';
GRANT SELECT ON mobilityserviceproviderdb.maintenance TO 'LogisticManager'@'%';
GRANT SELECT ON mobilityserviceproviderdb.driver TO 'LogisticManager'@'%';

# Create the Customer user
CREATE USER 'Customer'@'%' IDENTIFIED BY 'Customer ';
GRANT SELECT, UPDATE ON mobilityserviceproviderdb.customer TO 'Customer '@'%';
GRANT SELECT ON mobilityserviceproviderdb.booking TO 'Customer'@'%';
GRANT SELECT ON mobilityserviceproviderdb.scooter TO 'Customer'@'%';
GRANT SELECT ON mobilityserviceproviderdb.bicycle TO 'Customer'@'%';
GRANT SELECT ON mobilityserviceproviderdb.taxi TO 'Customer'@'%';

# Create the Driver user
CREATE USER 'Driver'@'%' IDENTIFIED BY 'Driver';
GRANT SELECT ON mobilityserviceproviderdb.booking TO 'Driver'@'%';
GRANT SELECT ON mobilityserviceproviderdb.taxi TO 'Driver'@'%';
GRANT SELECT ON mobilityserviceproviderdb.maintenance TO 'Driver'@'%';
GRANT SELECT ON mobilityserviceproviderdb.customer TO 'Driver'@'%';