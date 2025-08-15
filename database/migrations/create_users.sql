-- ============================================================
-- Script: create_users.sql
-- Description: Initializes the database schema and data
-- Author: Rohit Dham
-- Date: 2025-08-15
-- Dependencies: None
-- ============================================================

DO $$
BEGIN
    -- Try to create table
    CREATE TABLE IF NOT EXISTS users(
        id SERIAL PRIMARY KEY,
        username VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(50) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        created_at TIMESTAMP DEFAULT NOW()
    );
    RAISE NOTICE 'Users table created successfully.';
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Users table already exists or error occurred.';
END;
$$;

DO $$
BEGIN
    -- Insert dummy data into table (only if not exists)
    INSERT INTO users (username, email, password)
    SELECT 'rdham1119', 'rdhammpls@gmail.com', 'password1234'
    WHERE NOT EXISTS (
        SELECT 1 FROM users WHERE username='rdham1119'
    );
    RAISE NOTICE 'Added user rdham1119.';
END;
$$;

DO $$
BEGIN
    -- Verify user exists
    PERFORM 1 FROM users WHERE username='rdham1119';
    RAISE NOTICE 'User rdham1119 exists in the table.';
END;
$$;
