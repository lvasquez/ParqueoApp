using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp.Domain;

namespace WebApp.Repo
{
    public interface IVehiculoRepository
    {

        IList<VEHICULO> GetVehiculos();

        VEHICULO Ingreso(VEHICULO vehiculo);

        VEHICULO Salida(VEHICULO vehiculo);

        VEHICULO Read(string id);
    }
}
