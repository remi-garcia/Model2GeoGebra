# Model2GeoGebra
Graphically solves [JuMP](https://github.com/jump-dev/JuMP.jl) model (with two decision variables) using [GeoGebra](https://github.com/geogebra/geogebra)

### Usage
```julia
include("conversion.jl")

model = Model()
@variable(model, x_1 >= 0)
@variable(model, x_2 >= 0)

@objective(model, Max, 2x_1 + x_2)
@constraint(model, -x_1 + x_2 <= 2)
@constraint(model, x_1 + x_2 <= 6)
@constraint(model, x_1 <= 4)

conversion(model)
```

A GeoGebra file named `geogebra.ggb` is generated:
![alt text](https://raw.githubusercontent.com/remi-garcia/Model2GeoGebra/main/geogebra_example.png "GeoGebra example")
