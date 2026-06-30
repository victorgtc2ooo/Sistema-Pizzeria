import unittest
from unittest.mock import patch

from src import clientes


class FakeCursor:
    def __init__(self, existing_email=False):
        self.existing_email = existing_email
        self.executed = []

    def execute(self, query, params):
        self.executed.append((query, params))

    def fetchone(self):
        if self.existing_email:
            return (1,)
        return None

    def close(self):
        pass


class FakeDB:
    def __init__(self, existing_email=False):
        self.existing_email = existing_email
        self.committed = False

    def cursor(self):
        return FakeCursor(self.existing_email)

    def commit(self):
        self.committed = True

    def close(self):
        pass


class RegistrarClientesTests(unittest.TestCase):
    @patch("src.clientes.conectar_db")
    def test_registrar_cliente_rechaza_correo_duplicado(self, mock_conectar_db):
        mock_conectar_db.return_value = FakeDB(existing_email=True)

        exito, mensaje = clientes.registrar_clientes(
            "Juan",
            "Pérez",
            "dup@example.com",
            "123456",
            "5551234",
            "Calle 1",
        )

        self.assertFalse(exito)
        self.assertIn("correo ya está registrado", mensaje.lower())


if __name__ == "__main__":
    unittest.main()
