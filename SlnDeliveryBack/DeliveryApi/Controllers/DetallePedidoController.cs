using BEUDelivery;
using BEUDelivery.Transaction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DeliveryApi.Controllers
{
    public class DetallePedidoController : ApiController
    {
        public IHttpActionResult Post(DetallePedido dpedido)
        {
            try
            {
                DetallePedidoBLL.Create(dpedido);
                return Content(HttpStatusCode.Created, "Materia creado correctamente");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        /*public IHttpActionResult Get()
        {
            try
            {
                List<DetallePedido> todos = DetallePedidoBLL.List();
                return Content(HttpStatusCode.OK, todos);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

        public IHttpActionResult Put(DetallePedido dpedido)
        {
            try
            {
                DetallePedidoBLL.Update(dpedido);
                return Content(HttpStatusCode.OK, "Materia actualizado correctamente");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Get(int id)
        {
            try
            {
                DetallePedido result = DetallePedidoBLL.Get(id);
                if (result == null)
                {
                    return NotFound();
                }
                return Content(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

        public IHttpActionResult Delete(int id)
        {
            try
            {
                DetallePedidoBLL.Delete(id);
                return Ok("Materia eliminado correctamente");
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }*/
    }
}
