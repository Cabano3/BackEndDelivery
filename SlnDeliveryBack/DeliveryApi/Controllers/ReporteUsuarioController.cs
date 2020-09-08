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
    public class ReporteUsuarioController : ApiController
    {
        public IHttpActionResult Get()
        {
            List<rptNumeroPedidos_Result> todos = ReportesBLL.GetPedidosCliente();
            return Json(todos);
        }
    }
}
