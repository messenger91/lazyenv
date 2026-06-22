CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(20) NOT NULL DEFAULT 'user',
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO users (name, email, role) VALUES
    ('Alice Johnson', 'alice@example.com', 'admin'),
    ('Bob Smith', 'bob@example.com', 'user'),
    ('Carol White', 'carol@example.com', 'user'),
    ('Dave Brown', 'dave@example.com', 'manager');

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    owner_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO projects (name, description, owner_id) VALUES
    ('Lazyenv', 'Local environment manager', 1),
    ('Website Redesign', 'Company website refresh', 4),
    ('API Gateway', 'Microservices API gateway', 1);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(300) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    project_id INTEGER REFERENCES projects(id),
    assignee_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO tasks (title, status, project_id, assignee_id) VALUES
    ('Add Docker network setup', 'done', 1, 1),
    ('Write pg_dump script', 'done', 1, 1),
    ('Implement restore commands', 'in_progress', 1, 2),
    ('Design mockups', 'done', 2, 3),
    ('Develop frontend', 'in_progress', 2, 3),
    ('Setup CI/CD', 'pending', 2, 4),
    ('Design API schema', 'done', 3, 1),
    ('Implement auth middleware', 'in_progress', 3, 2),
    ('Write integration tests', 'pending', 3, 2);