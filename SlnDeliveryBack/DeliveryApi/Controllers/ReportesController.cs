using BEUDelivery;
using BEUDelivery.Transaction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Helpers;
using System.Web.Http;
using System.Web.Http.Cors;

namespace DeliveryApi.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class ReportesController : ApiController
    {
        public IHttpActionResult Get()
        {
            List<rptProductosVendidos_Result> todos = ReportesBLL.GetProductosVendidos();
            return Json(todos);                      
        }

        /*public IHttpActionResult GetCantidad()
        {
            List<rptNumeroPedidos_Result> ventas = ReportesBLL.GetPedidosCliente();
            return Json(ventas);
        }*/
    }
}
