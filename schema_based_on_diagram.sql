CREATE TABLE patients(
   id serial PRIMARY KEY,
   name varchar(64),
   date_of_birth date
  );
  
  CREATE TABLE invoices(
   id serial PRIMARY KEY,
   total_amount decimal,
   generated_at timestamp,
   payed_at timestamp,
   medical_history_id int not null unique,
   constraint medical_history_fk
   foreign key(medical_history_id)
   references medical_histories(id);
   );
   
    CREATE TABLE treatments(
      id serial PRIMARY KEY,
      type varchar(64),
      name varchar(64)
      );
      
    CREATE TABLE medical_histories(
     id serial PRIMARY KEY,
     admitted_at timestamp,
     patient_id int,
     CONSTRAINT patient_fk
     FOREIGN KEY(patient_id)
     REFERENCES patients(id),
     status varchar(120)
     );
     
   CREATE TABLE invoice_items(
    id serial primary key,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    CONSTRAINT invoice_fk
    FOREIGN KEY(invoice_id)
    REFERENCES invoices(id),
    treatment_id int,
    CONSTRAINT treatment_fk
    FOREIGN KEY(treatment_id)
    REFERENCES treatments(id)
   );
      
  CREATE TABLE history_treatment(
   treatment_id int,
   CONSTRAINT treatment_fk 
   FOREIGN KEY(treatment_id)
   REFERENCES treatments(id),
   history_id int,
   CONSTRAINT history_fk 
   FOREIGN KEY(history_id)
   REFERENCES medical_histories(id)
   );
   
   /* INDEXES */
  CREATE INDEX patient_asc ON medical_histories (patient_id ASC);
  CREATE INDEX medical_hist ON invoices (medical_history_id ASC);
  CREATE INDEX invoice_items_inv ON invoice_items (invoice_id ASC);
  CREATE INDEX invoice_items_treat ON invoice_items (treatment_id ASC);
  CREATE INDEX med_history_asc ON  history_treatment (history_id ASC);
  CREATE INDEX treatment_asc ON  history_treatment (treatment_id ASC);

