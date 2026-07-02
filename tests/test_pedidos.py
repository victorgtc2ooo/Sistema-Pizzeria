import unittest
from unittest.mock import patch

from app import app


class PedidosMesaTests(unittest.TestCase):
    def test_api_mis_pedidos_activos_filtra_por_numero_mesa(self):
        client = app.test_client()

        pedidos_ejemplo = [
            {
                "id_pedido": 10,
                "numero_mesa": 4,
                "id_cliente": None,
                "estado": "Pendiente",
                "total_p": 20.0,
                "productos": [],
            }
        ]

        with patch("app.obtener_pedido", return_value=pedidos_ejemplo) as mock_obtener:
            respuesta = client.get("/api/mis_pedidos_activos?numero_mesa=4")

        self.assertEqual(respuesta.status_code, 200)
        self.assertEqual(respuesta.get_json(), pedidos_ejemplo)
        mock_obtener.assert_called_once_with(numero_mesa=4)

    def test_api_cancelar_pedido_actualiza_estado_a_cancelado(self):
        client = app.test_client()

        with patch("app.cancelar_pedido", return_value=True) as mock_cancelar:
            respuesta = client.put("/api/pedido/10/cancelar")

        self.assertEqual(respuesta.status_code, 200)
        self.assertEqual(respuesta.get_json()["mensaje"], "El pedido ha sido cancelado")
        mock_cancelar.assert_called_once_with(10)


if __name__ == "__main__":
    unittest.main()
