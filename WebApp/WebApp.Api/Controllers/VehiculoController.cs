using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApp.Domain;
using WebApp.Repo;

namespace WebApp.Api.Controllers
{
    public class VehiculoController : ApiController
    {

        readonly IVehiculoRepository _vehiculoRepository;

        public VehiculoController(IVehiculoRepository vehiculoRepository)
        {
            _vehiculoRepository = vehiculoRepository;
        }
        // GET: api/Vehiculo
        [HttpGet]
        public IList<VEHICULO> Get()
        {
            return _vehiculoRepository.GetVehiculos();
        }

        [HttpGet]
        public HttpResponseMessage GetVehiculo(string id)
        {
            VEHICULO vehiculo = this._vehiculoRepository.Read(id);
            if (vehiculo == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }
            return Request.CreateResponse(vehiculo);
        }

        // POST: api/Vehiculo
        [HttpPost]
        public HttpResponseMessage Post(VEHICULO vehiculo)
        {
            if (ModelState.IsValid)
            {
                vehiculo.fecha_entrada = DateTime.Now;
                this._vehiculoRepository.Ingreso(vehiculo);
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, vehiculo);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = vehiculo.placa }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // PUT: api/Vehiculo/5
        [HttpPut]
        public HttpResponseMessage PutVehiculo(VEHICULO vehiculo)
        {
            return PutVehiculo(vehiculo.placa, vehiculo);
        }

        [HttpPut]
        public HttpResponseMessage PutVehiculo(string id, VEHICULO vehiculo)
        {
            if (ModelState.IsValid && id == vehiculo.placa)
            {
                try
                {
                    this._vehiculoRepository.Salida(vehiculo);
                    return Request.CreateResponse(HttpStatusCode.OK, vehiculo);
                }
                catch (Exception)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }
    }
}
