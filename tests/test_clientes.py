import unittest
from unittest.mock import patch

from src import clientes


class FakeCursor:
    def __init__(self, existing_email=False, rows=None):
        self.existing_email = existing_email
        self.rows = rows or []
        self.executed = []
        self._result_rows = []

    def execute(self, query, params=None):
        self.executed.append((query, params))
        self._result_rows = list(self.rows)
        if "LIMIT" in query.upper() and params is not None:
            per_page = params[0]
            offset = params[1]
            self._result_rows = self.rows[offset : offset + per_page]

    def fetchone(self):
        if self.existing_email:
            return (1,)
        if self._result_rows:
            return self._result_rows[0]
        return None

    def fetchall(self):
        return self._result_rows

    def close(self):
        pass


class FakeDB:
    def __init__(self, existing_email=False, rows=None):
        self.existing_email = existing_email
        self.rows = rows or []
        self.committed = False

    def cursor(self):
        return FakeCursor(self.existing_email, self.rows)

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

    @patch("src.clientes.conectar_db")
    def test_obtener_clientes_devuelve_lista(self, mock_conectar_db):
        mock_conectar_db.return_value = FakeDB(
            rows=[(1, "Ana", "López", "ana@example.com", "3001112233", "Calle 2")]
        )

        resultado = clientes.obtener_clientes()

        self.assertEqual(len(resultado), 1)
        self.assertEqual(resultado[0]["nombre"], "Ana")

    @patch("src.clientes.conectar_db")
    def test_obtener_clientes_paginados_limita_resultados(self, mock_conectar_db):
        mock_conectar_db.return_value = FakeDB(
            rows=[
                (1, "Ana", "López", "ana@example.com", "3001112233", "Calle 1"),
                (2, "Luis", "Pérez", "luis@example.com", "3002223344", "Calle 2"),
            ]
        )

        resultado = clientes.obtener_clientes_paginados(page=1, per_page=1)

        self.assertEqual(len(resultado), 1)
        self.assertEqual(resultado[0]["id_cliente"], 1)


if __name__ == "__main__":
    unittest.main()
