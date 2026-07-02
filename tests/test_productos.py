import io
import unittest
from unittest.mock import ANY, patch

from app import app


class ProductosTests(unittest.TestCase):
    def test_api_registrar_producto_recibe_descripcion(self):
        client = app.test_client()

        with patch("app.registrar_producto", return_value=True) as mock_registrar:
            respuesta = client.post(
                "/api/productos",
                data={
                    "nombre": "Pizza Especial",
                    "precio": "12.50",
                    "id_categoria": "1",
                    "descripcion": "Queso, tomate y orégano",
                    "imagen_route": (io.BytesIO(b"fake-image"), "pizza.jpg"),
                },
                content_type="multipart/form-data",
            )

        self.assertEqual(respuesta.status_code, 200)
        mock_registrar.assert_called_once_with("Pizza Especial", "12.50", ANY, "1", "Queso, tomate y orégano")

    def test_api_actualizar_producto_recibe_descripcion(self):
        client = app.test_client()

        with patch("app.actualizar_producto", return_value=True) as mock_actualizar:
            respuesta = client.post(
                "/api/productos/actualizar/7",
                data={
                    "nombre": "Pizza Especial",
                    "precio": "12.50",
                    "id_categoria": "1",
                    "descripcion": "Nueva descripción",
                },
                content_type="multipart/form-data",
            )

        self.assertEqual(respuesta.status_code, 200)
        mock_actualizar.assert_called_once_with(7, "Pizza Especial", "12.50", None, "1", "Nueva descripción")


if __name__ == "__main__":
    unittest.main()
