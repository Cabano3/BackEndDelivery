using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUDelivery.Transaction
{
	public class DetallePedidoBLL
	{
		public static DetallePedido Get(int? id)
		{
			DeliveryEntities db = new DeliveryEntities();
			return db.DetallePedido.Find(id);
		}

		public static void Create(DetallePedido d)
		{
			using (DeliveryEntities db = new DeliveryEntities())
			{
				using (var transaction = db.Database.BeginTransaction())
				{
					try
					{
						Config(d);
						db.DetallePedido.Add(d);
						db.SaveChanges();
						transaction.Commit();
					}
					catch (Exception)
					{
						transaction.Rollback();
						throw;
					}
				}
			}
		}

		public static void Config(DetallePedido d)
		{
			/*d.subtotal = d.Producto.Sum(p => (p.precio * d.cantidad));
			d.total = d.Producto.Sum(x => (x.precio * d.iva));*/
		}

		public static void Update(DetallePedido d)
		{
			using (DeliveryEntities db = new DeliveryEntities())
			{
				using (var transaction = db.Database.BeginTransaction())
				{
					try
					{
						db.DetallePedido.Attach(d);
						db.Entry(d).State = System.Data.Entity.EntityState.Modified;
						db.SaveChanges();
						transaction.Commit();
					}
					catch (Exception ex)
					{
						transaction.Rollback();
						throw ex;
					}
				}
			}
		}

		public static void Delete(int? id)
		{
			using (DeliveryEntities db = new DeliveryEntities())
			{
				using (var transaction = db.Database.BeginTransaction())
				{
					try
					{
						DetallePedido d = db.DetallePedido.Find(id);
						db.Entry(d).State = System.Data.Entity.EntityState.Deleted;
						db.SaveChanges();
						transaction.Commit();
					}
					catch (Exception ex)
					{
						transaction.Rollback();
						throw ex;
					}
				}
			}
		}
	}
}
