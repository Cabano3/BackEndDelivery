//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BEUDelivery
{
	using Newtonsoft.Json;
	using System;
    using System.Collections.Generic;
    
    public partial class DetallePedido
    {
        public int idDetPedido { get; set; }
        public Nullable<int> cantidad { get; set; }
        public Nullable<decimal> subtotal { get; set; }
        public Nullable<decimal> recargaentrega { get; set; }
        public Nullable<decimal> iva { get; set; }
        public Nullable<int> idPedido { get; set; }
        public Nullable<int> idProducto { get; set; }

        [JsonIgnore]
        public virtual Pedido Pedido { get; set; }
        [JsonIgnore]
        public virtual Producto Producto { get; set; }
    }
}
