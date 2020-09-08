using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUDelivery.Transaction
{
	public class ReportesBLL
	{
		public static List<rptProductosVendidos_Result> GetProductosVendidos()
		{
			DeliveryEntities db = new DeliveryEntities();
			return db.rptProductosVendidos().ToList();
		}

		public static List<rptNumeroPedidos_Result> GetPedidosCliente()
		{
			DeliveryEntities db = new DeliveryEntities();
			return db.rptNumeroPedidos().ToList();
		}
	}
}
