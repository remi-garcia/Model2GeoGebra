using JuMP

function conversion(model::Model)
    if num_variables(model) != 2
        error("Only models with two variables can be converted to GeoGebra")
    end

    x, y = all_variables(model)

    coefs = Vector{Tuple{Float64, Float64, Float64, Bool}}()
    for cst in all_constraints(model, AffExpr, MOI.GreaterThan{Float64})
        push!(coefs, (normalized_coefficient(cst, x), normalized_coefficient(cst, y), normalized_rhs(cst), true))
    end
    for cst in all_constraints(model, AffExpr, MOI.LessThan{Float64})
        push!(coefs, (normalized_coefficient(cst, x), normalized_coefficient(cst, y), normalized_rhs(cst), false))
    end

    #point_obj = (objective_function(model)[x], objective_function(model)[y])
    point_obj = (get(objective_function(model).terms, x, 0.0), get(objective_function(model).terms, y, 0.0))

    open("geogebra.xml", "w") do f
        write(f, """
<?xml version="1.0" encoding="utf-8"?>
<geogebra format="5.0" version="5.0.620.0" app="classic" platform="offline" id="F0B3856E-58E2-4C3F-B8ED-7C0AF991ACA8"  xsi:noNamespaceSchemaLocation="http://www.geogebra.org/apps/xsd/ggb.xsd" xmlns="" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >
<gui>
	<window width="1848" height="1016" />
	<perspectives>
<perspective id="tmp">
	<panes>
		<pane location="" divider="0.18452380952380953" orientation="1" />
	</panes>
	<views>
		<view id="512" toolbar="0 | 1 501 5 19 , 67 | 2 15 45 18 , 7 37 | 514 3 9 , 13 44 , 47 | 16 51 | 551 550 11 ,  20 22 21 23 , 55 56 57 , 12 | 69 | 510 511 , 512 513 | 533 531 , 534 532 , 522 523 , 537 536 , 535 , 538 | 521 520 | 36 , 38 49 560 | 571 30 29 570 31 33 | 17 | 540 40 41 42 , 27 28 35 , 6 , 502" visible="false" inframe="false" stylebar="false" location="1,1,1" size="500" window="100,100,600,400" />
		<view id="4" toolbar="0 || 2020 , 2021 , 2022 || 2001 , 2003 , 2002 , 2004 , 2005 || 2040 , 2041 , 2042 , 2044 , 2043" visible="false" inframe="false" stylebar="false" location="1,1" size="300" window="100,100,600,400" />
		<view id="8" toolbar="1001 | 1002 | 1003  || 1005 | 1004 || 1006 | 1007 | 1010 || 1008 | 1009 || 6" visible="false" inframe="false" stylebar="false" location="1,3" size="300" window="100,100,600,400" />
		<view id="4097" visible="false" inframe="false" stylebar="true" location="1,1" size="344" window="100,100,700,550" />
		<view id="1" visible="true" inframe="false" stylebar="false" location="1" size="1499" window="100,100,600,400" />
		<view id="2" visible="true" inframe="false" stylebar="true" location="3" size="341" tab="ALGEBRA" window="100,100,600,400" />
		<view id="16" visible="false" inframe="false" stylebar="false" location="1" size="300" window="50,50,500,500" />
		<view id="32" visible="false" inframe="false" stylebar="true" location="1" size="300" window="50,50,500,500" />
		<view id="64" toolbar="0" visible="false" inframe="false" stylebar="false" location="1" size="480" window="50,50,500,500" />
		<view id="128" visible="false" inframe="false" stylebar="false" location="1" size="480" window="50,50,500,500" />
		<view id="70" toolbar="0 || 2020 || 2021 || 2022" visible="false" inframe="false" stylebar="true" location="1" size="900" window="50,50,500,500" />
	</views>
	<toolbar show="true" items="0 73 62 | 1 501 67 , 5 19 , 72 75 76 | 2 15 45 , 18 65 , 7 37 | 4 3 8 9 , 13 44 , 58 , 47 | 16 51 64 , 70 | 10 34 53 11 , 24  20 22 , 21 23 | 55 56 57 , 12 | 36 46 , 38 49  50 , 71  14  68 | 30 29 54 32 31 33 | 25 17 26 60 52 61 | 40 41 42 , 27 28 35 , 6" position="1" help="false" />
	<input show="true" cmd="true" top="algebra" />
	<dockBar show="false" east="false" />
</perspective>
	</perspectives>
	<labelingStyle  val="0"/>
	<font  size="16"/>
</gui>
<euclidianView>
	<viewNumber viewNo="1"/>
	<size  width="1499" height="963"/>
	<coordSystem xZero="302.2278178518016" yZero="553.9915207563241" scale="180.28883765485202" yscale="180.28883765485207"/>
	<evSettings axes="true" grid="true" gridIsBold="false" pointCapturing="3" rightAngleStyle="1" checkboxSize="26" gridType="3"/>
	<bgColor r="255" g="255" b="255"/>
	<axesColor r="0" g="0" b="0"/>
	<gridColor r="192" g="192" b="192"/>
	<lineStyle axes="1" grid="0"/>
	<axis id="0" show="true" label="" unitLabel="" tickStyle="1" showNumbers="true"/>
	<axis id="1" show="true" label="" unitLabel="" tickStyle="1" showNumbers="true"/>
</euclidianView>
<algebraView>
	<mode val="2"/>
	<auxiliary show="true"/>
	<collapsed val="0,3"/>
</algebraView>
<kernel>
	<continuous val="false"/>
	<usePathAndRegionParameters val="true"/>
	<decimals val="2"/>
	<angleUnit val="degree"/>
	<algebraStyle val="3" spreadsheet="0"/>
	<coordStyle val="0"/>
</kernel>
<tableview min="-2" max="2" step="1"/>
<scripting blocked="false" disabled="false"/>
<construction title="" author="" date="">
<element type="numeric" label="v">
	<value val="0"/>
	<show object="false" label="true"/>
	<objColor r="0" g="0" b="255" alpha="0.10000000149011612"/>
	<layer val="2"/>
	<labelMode val="1"/>
	<slider min="-5" max="5" absoluteScreenLocation="true" width="200" x="545" y="515" fixed="false" horizontal="true" showAlgebra="true"/>
	<lineStyle thickness="10" type="0" typeHidden="1"/>
	<animation speed="1" type="0" playing="false"/>
</element>
""")

    # Constraints
    allcstexp = ""
    for i in 1:length(coefs)
        const_expression = ""
        const_expression_eq = ""
        if !(coefs[i][1] in [0,1])
            const_expression *= "("
            if coefs[i][1] < 0
                const_expression *= "-"
            end
            if coefs[i][1] != -1
                const_expression *= "$(abs(coefs[i][1])) * x"
            else
                const_expression *= "x"
            end

            const_expression *= ") "
        else
            if coefs[i][1] == 1
                const_expression *= "x "
            end
        end

        if coefs[i][1] != 0 && coefs[i][2] != 0
            const_expression *= "+ "
        end

        if !(coefs[i][2] in [0,1])
            const_expression *= "("
            if coefs[i][2] < 0
                const_expression *= "-"
            end
            if coefs[i][2] != -1
                const_expression *= "$(abs(coefs[i][2])) * y"
            else
                const_expression *= "y"
            end

            const_expression *= ") "
        else
            if coefs[i][2] == 1
                const_expression *= "y "
            end
        end

        const_expression_eq = const_expression

        if coefs[i][4]
            const_expression *= "≥ "
        else
            const_expression *= "≤ "
        end

        const_expression *= "$(coefs[i][3])"
        const_expression_eq *= "= $(coefs[i][3])"

        allcstexp *= " ∧ " * const_expression

        write(f, """
<expression label="cst$i" exp="cst$i(x, y) = $const_expression"/>
<element type="functionnvar" label="cst$i">
	<show object="false" label="false" ev="4"/>
	<objColor r="0" g="0" b="0" alpha="0" fillType="4" hatchAngle="45" hatchDistance="20" inverseFill="true"/>
	<layer val="1"/>
	<labelMode val="0"/>
	<animation step="0.1" speed="1" type="0" playing="false"/>
	<lineStyle thickness="3" type="0" typeHidden="1"/>
</element>$(coefs[i][1] == 0 ? "\n<expression label=\"c$(i)\" exp=\"$(replace(replace(const_expression, "≤" => "="), "≥" => "="))\" type=\"line\"/>" : "")
<element type="line" label="c$(i)">
	<show object="false" label="true" ev="4"/>
	<objColor r="0" g="0" b="0" alpha="0"/>
	<layer val="1"/>
	<labelMode val="0"/>
	<fixed val="true"/>
	<coords x="$(coefs[i][1])" y="$(coefs[i][2])" z="-$(coefs[i][3])"/>
	<lineStyle thickness="3" type="0" typeHidden="1"/>
	<eqnStyle style="implicit"/>
</element>
""")
    end

    # Var bounds
    bounds = ""
    if has_lower_bound(x)
        bounds *= " ∧ x ≥ $(lower_bound(x))"
    end
    if has_upper_bound(x)
        bounds *= " ∧ x ≤ $(upper_bound(x))"
    end
    if has_lower_bound(y)
        bounds *= " ∧ y ≥ $(lower_bound(y))"
    end
    if has_upper_bound(y)
        bounds *= " ∧ y ≤ $(upper_bound(y))"
    end

    if bounds != ""
        write(f, """
<expression label="var" exp="var(x, y) = $(bounds[(sizeof(" ∧ ")+1):end])"/>
<element type="functionnvar" label="var">
	<show object="false" label="false" ev="4"/>
	<objColor r="0" g="0" b="0" alpha="0" fillType="4" hatchAngle="45" hatchDistance="20" inverseFill="true"/>
	<layer val="1"/>
	<labelMode val="0"/>
	<animation step="0.1" speed="1" type="0" playing="false"/>
	<lineStyle thickness="3" type="0" typeHidden="1"/>
</element>
""")
    end

    allcstexp *= bounds
    write(f, """
<expression label="cst" exp="cst(x, y) = $(allcstexp[(sizeof(" ∧ ")+1):end])"/>
<element type="functionnvar" label="cst">
	<show object="false" label="false" ev="4"/>
	<objColor r="204" g="153" b="255" alpha="0.28"/>
	<layer val="1"/>
	<labelMode val="0"/>
	<animation step="0.1" speed="1" type="0" playing="false"/>
	<lineStyle thickness="0" type="0" typeHidden="1"/>
</element>
""")

    # Objective
    write(f, """
<element type="point" label="OBJ">
	<show object="false" label="true" ev="4"/>
	<objColor r="125" g="125" b="255" alpha="0"/>
	<layer val="2"/>
	<labelMode val="0"/>
	<animation step="0.1" speed="1" type="1" playing="false"/>
	<coords x="$(point_obj[1])" y="$(point_obj[2])" z="1"/>
	<pointSize val="5"/>
	<pointStyle val="0"/>
</element>
<expression label="ZERO" exp="(0, 0)" type="point"/>
<element type="point" label="ZERO">
	<show object="false" label="true" ev="4"/>
	<objColor r="125" g="125" b="255" alpha="0"/>
	<layer val="0"/>
	<labelMode val="0"/>
	<animation step="0.1" speed="1" type="1" playing="false"/>
	<coords x="0" y="0" z="1"/>
	<pointSize val="5"/>
	<pointStyle val="0"/>
</element>
<command name="Ray">
	<input a0="ZERO" a1="OBJ"/>
	<output a0="a"/>
</command>
<element type="ray" label="a">
	<show object="false" label="false" ev="4"/>
	<objColor r="0" g="0" b="255" alpha="0.75"/>
	<layer val="2"/>
	<labelMode val="0"/>
	<coords x="$(-point_obj[2])" y="$(point_obj[1])" z="0"/>
	<lineStyle thickness="2" type="0" typeHidden="1"/>
	<outlyingIntersections val="false"/>
	<keepTypeOnTransform val="true"/>
</element>
<expression label="A" exp="(($(point_obj[1]) * v), ($(point_obj[2]) * v))" type="point" />
<element type="point" label="A">
	<show object="false" label="true" ev="4"/>
	<objColor r="125" g="125" b="255" alpha="0"/>
	<layer val="0"/>
	<labelMode val="0"/>
	<coords x="0" y="0" z="1"/>
	<pointSize val="5"/>
	<pointStyle val="0"/>
</element>
<command name="OrthogonalLine">
	<input a0="A" a1="a"/>
	<output a0="f"/>
</command>
<element type="line" label="f">
	<show object="false" label="false" ev="4"/>
	<objColor r="0" g="0" b="255" alpha="0"/>
	<layer val="2"/>
	<labelMode val="0"/>
	<coords x="$(-point_obj[1])" y="$(-point_obj[2])" z="0"/>
	<lineStyle thickness="5" type="0" typeHidden="1" opacity="178"/>
	<eqnStyle style="implicit"/>
</element>
""")


    write(f, """
</construction>
</geogebra>
""")
    end

    # Compress geogebra.xml
    run(`zip geogebra.zip geogebra.xml`)

    # Delete geogebra.xml
    rm("geogebra.xml")

    # Convert into geogebra.ggb
    mv("geogebra.zip", "geogebra.ggb", force=true)

    return nothing
end
