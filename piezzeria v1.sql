
CREATE TABLE Ingredientes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Calorias INT,
    Gramos DECIMAL(10, 2)
);

INSERT INTO Ingredientes (ID, Nombre, Calorias, Gramos) VALUES
(1, 'Jamón', 150, 100),
(2, 'Pepperoni', 200, 100),
(3, 'Champiñones', 20, 50),
(4, 'Pimientos', 30, 50),
(5, 'Cebolla', 40, 50),
(6, 'Aceitunas', 25, 50),
(7, 'Salchicha', 180, 100),
(8, 'Tocino', 250, 100),
(9, 'Pavo', 120, 100),
(10, 'Anchoas', 300, 50);

SELECT * FROM Ingredientes  ORDER BY Nombre ASC


CREATE TABLE Pizza (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Tamaño VARCHAR(100),
    Precio DECIMAL(10, 2)
);

INSERT INTO Pizza (ID, Nombre, Tamaño, Precio) VALUES
(1, 'Pizza Angie', 'Mediana', 12.99),
(2, 'Pizza Herrera Cetz', 'Grande', 15.99),
(3, 'Pizza Alpuche', 'Grande', 14.99),
(4, 'Pizza Lampon', 'Familiar', 18.99),
(5, 'Pizza Anaconda', 'Mediana', 13.99);

SELECT * FROM Pizza ORDER by nombre ASC;
SELECT * FROM Pizza WHERE nombre= 'Pizza Angie'

CREATE TABLE PizzaIngredientes (
    PizzaID INT,
    IngredienteID INT,
    FOREIGN KEY (PizzaID) REFERENCES Pizza(ID),
    FOREIGN KEY (IngredienteID) REFERENCES Ingredientes(ID),
    PRIMARY KEY (PizzaID, IngredienteID)
);

INSERT INTO PizzaIngredientes (PizzaID, IngredienteID) VALUES
(1, 1),   -- Pizza Angie: Jamón
(1, 10),  -- Pizza Angie: Anchoas
(2, 2),   -- Pizza Herrera Cetz: Pepperoni
(2, 3),   -- Pizza Herrera Cetz: Champiñones
(2, 4),   -- Pizza Herrera Cetz: Pimientos
(3, 1),   -- Pizza Alpuche: Jamón
(3, 5),   -- Pizza Alpuche: Cebolla
(4, 6),   -- Pizza Lampon: Aceitunas
(5, 7),   -- Pizza Anaconda: Salchicha
(5, 8),   -- Pizza Anaconda: Tocino
(5, 9);   -- Pizza Anaconda: Pavo

UPDATE PizzaIngredientes
SET IngredienteID = 3
WHERE PizzaID = 1 AND IngredienteID = 1;

UPDATE PizzaIngredientes
SET IngredienteID = 1
WHERE PizzaID = 5 AND IngredienteID = 7;

(1, 7),  -- Pizza Angie: Salchicha
(1, 10), -- Pizza Angie: Anchoas
(2, 2),  -- Pizza Herrera Cetz: Pepperoni
(2, 3),  -- Pizza Herrera Cetz: Champiñones
(2, 4),  -- Pizza Herrera Cetz: Pimientos
(3, 1),  -- Pizza Alpuche: Jamón
(3, 5),  -- Pizza Alpuche: Cebolla
(4, 6),  -- Pizza Lampon: Aceitunas
(5, 1),  -- Pizza Anaconda: Jamon
(5, 8),  -- Pizza Anaconda: Tocino
(5, 9);  -- Pizza Anaconda: Pavo

SELECT * FROM pizzaingredientes  ORDER BY PizzaID ASC

-- Eliminar la fila correspondiente a la anchoa (ingrediente 10)
DELETE FROM PizzaIngredientes
WHERE PizzaID = 1 AND IngredienteID = 1;

-- Añadir la fila correspondiente a la salchicha (ingrediente 7)
INSERT INTO PizzaIngredientes (PizzaID, IngredienteID) VALUES (1, 7);

-- Modificar la tabla Ingredientes
ALTER TABLE Ingredientes
ADD Proveedor VARCHAR(100);

-- Modificar la tabla PizzaIngredientes
ALTER TABLE PizzaIngredientes
ADD Cantidad INT;

-- Eliminar la columna Cantidad de la tabla PizzaIngredientes
ALTER TABLE PizzaIngredientes
DROP COLUMN Cantidad;


SELECT p.ID AS PizzaID, p.Nombre AS PizzaNombre, i.ID AS IngredienteID, i.Nombre AS IngredienteNombre
FROM PizzaIngredientes pi
JOIN Pizza p ON pi.PizzaID = p.ID
JOIN Ingredientes i ON pi.IngredienteID = i.ID
ORDER BY p.ID ASC;

