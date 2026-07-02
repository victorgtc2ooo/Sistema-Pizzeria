import unittest
from unittest.mock import patch

from app import app


class InventarioTests(unittest.TestCase):
    def test_api_inventario_rechaza_stock_negativo(self):
        client = app.test_client()

        with patch("app.registrar_inventario") as mock_registrar:
            respuesta = client.post(
                "/api/inventario",
                json={
                    "nombre_i": "Queso",
                    "stock_actual": -5,
                    "stock_minimo": 1,
                    "unidad_registrada": "Kg",
                },
            )

        self.assertEqual(respuesta.status_code, 400)
        self.assertEqual(respuesta.get_json()["mensaje"], "Los valores de stock no pueden ser negativos")
        mock_registrar.assert_not_called()

    def test_api_actualizar_inventario_rechaza_stock_negativo(self):
        client = app.test_client()

        with patch("app.actualizar_inventario") as mock_actualizar:
            respuesta = client.put(
                "/api/inventario/actualizar",
                json={
                    "id_inventario": 1,
                    "nombre": "Queso",
                    "cantidad_inicial": -2,
                    "cantidad_minima": 1,
                    "unidad": "Kg",
                },
            )

        self.assertEqual(respuesta.status_code, 400)
        self.assertEqual(respuesta.get_json()["mensaje"], "Los valores de stock no pueden ser negativos")
        mock_actualizar.assert_not_called()


if __name__ == "__main__":
    unittest.main()
