using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp.Domain;


namespace WebApp.Repo
{
    public class VehiculoRepository : IVehiculoRepository
    {
        public IList<VEHICULO> GetVehiculos()
        {
            using (var context = new EstacionamientoDBEntities())
            {
                var list = context.VEHICULOS.ToList();
                foreach (var item in list)
                {
                    TimeSpan span = DateTime.Now.Subtract(item.fecha_entrada);
                    item.rowid = item.rowid;
                    item.placa = item.placa;
                    item.fecha_entrada = item.fecha_entrada;
                    item.fecha_salida = item.fecha_salida;
                    item.oficial = item.oficial;
                    if (item.oficial == true)
                        item.tarifa = 0;
                    else
                        item.tarifa = Math.Round((double)span.TotalMinutes * 1.5, 2);
                }
                return list;
            }
        }


        public VEHICULO Ingreso(VEHICULO vehiculo)
        {
            using (var context = new EstacionamientoDBEntities())
            {

               VEHICULO temp = context.VEHICULOS.Where(x => x.placa == vehiculo.placa).OrderByDescending(x => x.rowid).FirstOrDefault();
                if (temp != null && temp.fecha_salida is null) {
                    return null;
                }
                else {
                    vehiculo.tarifa = 0;
                    context.VEHICULOS.Add(vehiculo);
                    context.SaveChanges();
                    return vehiculo;
                }           
            }
        }

        public VEHICULO Read(string id)
        {
            using (var context = new EstacionamientoDBEntities())
            {
               VEHICULO vehiculo = context.VEHICULOS.Where(x=>x.placa == id).OrderByDescending(x => x.rowid).FirstOrDefault();
                if (vehiculo != null)
                {
                    if (vehiculo.oficial == true)
                    {
                        vehiculo.tarifa = 0;
                    }
                    else
                    {
                        TimeSpan span = DateTime.Now.Subtract(vehiculo.fecha_entrada);
                        vehiculo.tarifa = Math.Round((double)span.TotalMinutes * 1.5, 2);
                    }
                }            
               return vehiculo;
            }
        }

        public VEHICULO Salida(VEHICULO vehiculo)
        {
            using (var context = new EstacionamientoDBEntities())
            {
                var data = context.VEHICULOS.Where(x => x.placa == vehiculo.placa).OrderByDescending(x => x.rowid).FirstOrDefault();
                if (data != null)
                {
                    data.tarifa = vehiculo.tarifa;
                    data.fecha_salida = DateTime.Now;
                    context.VEHICULOS.Add(data);
                    context.Entry(data).State = System.Data.Entity.EntityState.Modified;
                    context.SaveChanges();
                    return vehiculo;
                }
                else
                    return vehiculo;
            }
        }

    }
}
