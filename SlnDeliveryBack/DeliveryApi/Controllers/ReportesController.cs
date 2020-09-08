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
        public IHttpActionResult Get(int i)
        {
            try
            {
                if (i == 1)
                {
                    List<rptProductosVendidos_Result> todos = ReportesBLL.GetProductosVendidos();
                    return Content(HttpStatusCode.OK, todos);
                }
                else 
                {
                    List<rptNumeroPedidos_Result> todos = ReportesBLL.GetPedidosCliente();
                    return Content(HttpStatusCode.OK, todos);
                }
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
                      
        }
    }
}
