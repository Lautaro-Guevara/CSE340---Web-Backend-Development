-- Type: account_type

-- DROP TYPE IF EXISTS public.account_type;

CREATE TYPE public.account_type AS ENUM
    ('Client', 'Employee', 'Admin');

ALTER TYPE public.account_type
    OWNER TO cse340;


-- Table structure for table 'classification'
CREATE TABLE public.clasification(
	classification_id INT GENERATED BY DEFAULT AS IDENTITY,
	classification_name CHARACTER VARYING NOT NULL,
	CONSTRAINT classification_pk PRIMARY KEY (classification_id)
);

-- Table strucure for table 'inventory'
CREATE TABLE IF NOT EXISTS public.inventory
(
	inv_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	inv_make character varying NOT NULL,
	inv_model character varying NOT NULL,
	inv_year character(4) NOT NULL,
	inv_description text NOT NULL,
	inv_image character varying NOT NULL,
	inv_thumbnail character varying NOT NULL,
	inv_price numeric(9, 0) NOT NULL,
	inv_miles integer NOT NULL,
	inv_color character varying NOT NULL,
	classification_id integer NOT NULL,
	CONSTRAINT inventory_pkey PRIMARY KEY (inv_id)
);

-- Create relationship between 'classification' and 'inventory' tables
ALTER TABLE IF EXISTS public.inventory
	ADD CONSTRAINT fk_classification FOREIGN KEY (classification_id)
	REFERENCES public.classification (classification_id) MATCH SIMPLE
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

-- Table structure for table 'account'
CREATE TABLE IF NOT EXISTS public.account
(
	account_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	account_firstname character varying NOT NULL,
	account_lastname character varying NOT NULL,
	account_email character varying NOT NULL,
	account_password character varying NOT NULL,
	account_type account_type NOT NULL DEFAULT 'Client'::account_type,
	CONSTRAINT account_pkey PRIMARY KEY (account_id)
);

-- Data for table 'classification'
INSERT INTO public.classification (classification_name)
VALUE ('Custom'),
('Sport'),
('SUV'),
('Truck'),
('Sedan');