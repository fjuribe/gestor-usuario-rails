#https://github.com/kickstarter/rack-attack ,ducumentacion oficial

class Rack::Attack
Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

# Permitir el tráfico local
safelist('permitir-trafico-local') do |req|
	'127.0.0.1' == req.ip || '::1:' == req.ip
end


#limitar el numero de busqueda de una ip
throttle('req/ip', limit: 5, period: 5) do |req|
	req.ip
end

#cuando superamos el limite debemos enviar una respuesta
self.throttled_response = -> (env) {
	retry_after = (env['rack.attack.match_data'] || {})[:period]
	[
		429,
		{'Content-Type' => 'application/json', 
		 'Retry-After'	=> retry_after.to_s},
		 [{error: 'limite alcanzado. intente mas tarde!!'}.to_json]
	]
}

end