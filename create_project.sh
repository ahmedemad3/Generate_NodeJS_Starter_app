#!/bin/bash

# Step 1: Create project folder
mkdir startup-project
cd startup-project

# Step 2: Initialize npm
npm init -y

# Step 3: Install required modules
npm install express pg jwt express-validator dotenv cors body-parser

# Step 4: Create server.js file
cat > server.js <<EOF
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(cors());

// Add your routes here
app.use('/api', require('./routes'));

app.listen(port, () => {
  console.log(\`Server listening on port \${port}\`);
});
EOF

# Step 5: Create database connection pooling file
cat > db.js <<EOF
const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
});

module.exports = pool;
EOF

# Step 6: Create .env file
cat > .env <<EOF
PORT=3000
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_HOST=your_db_host
DB_PORT=your_db_port
DB_NAME=your_db_name
EOF

# Step 7: Create authentication and authorization module files
mkdir authentication
cd authentication
cat > controller.js <<EOF
// Authentication and authorization controller
EOF

cat > model.js <<EOF
// Authentication and authorization model
EOF

cat > router.js <<EOF
// Authentication and authorization router
EOF

cat > service.js <<EOF
// Authentication and authorization service
EOF

cd ..

# Step 8: Create modular architecture folders
mkdir routes models controllers services db-scripts error-handlers

# Step 9: Create database scripts for authentication and authorization
# touch db-scripts/authentication.sql db-scripts/authorization.sql
# Step 8: Create database scripts for authentication and authorization
echo "CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);" > db-scripts/authentication.sql

echo "CREATE TABLE IF NOT EXISTS roles (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);" > db-scripts/authorization.sql

echo "ALTER TABLE users ADD COLUMN role_id INT REFERENCES roles(id);" > db-scripts/add-column.sql

echo "Files generated successfully!"

# Step 10: Create error handler module
touch error-handlers/errorHandler.js
