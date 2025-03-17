# Run the docker build command
docker build `
--build-arg PERSONAL_ACCESS_TOKEN='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' `
--build-arg GITHUB_USERNAME='anthonypanzz' `
--build-arg REPOSITORY_NAME='application-codes' `
--build-arg WEB_FILE_ZIP='rentzone.zip' `
--build-arg WEB_FILE_UNZIP='rentzone' `
--build-arg DOMAIN_NAME='www.anthonypanzz.com' `
--build-arg RDS_ENDPOINT='dev-rds-db.cfk6o0o6qb85.us-east-1.rds.amazonaws.com' `
--build-arg RDS_DB_NAME='applicationdb' `
--build-arg RDS_MASTER_USERNAME='apanzz' `
--build-arg RDS_DB_PASSWORD='brookie22!' `
-t rentzone .