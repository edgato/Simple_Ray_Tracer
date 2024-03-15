classdef Lens
    properties
        RefractiveIndex {mustBeNumeric} % Refractive index of the lens material
        Position {mustBeNumeric} % [x, y] position of the lens center
        Orientation {mustBeNumeric} % Angle (in degrees) of lens orientation (0° = horizontal)
        Radius{mustBeNumeric} % Radius in meters
        Thickness{mustBeNumeric} % Thickness of the lens body
        Rc1{mustBeNumeric} % curvature surface 1 inf=flat surface
        Rc2{mustBeNumeric} % curvature surface 2 inf=flat surface
        surface{mustBeNumeric} % surface of the lens
    end
    methods
        function obj = Lens(refractiveIndex, position, orientation,radius,thickness,Rc1,Rc2)
            % Constructor: Initialize properties
            obj.RefractiveIndex = refractiveIndex;
            obj.Position = position;
            obj.Orientation = orientation;
            obj.Radius = radius;
            obj.Thickness = thickness;
            obj.Rc1 = Rc1;
            obj.Rc2 = Rc2;
            obj.surface=curvature(obj);
        end
        function exit=draw(obj)
            plot(obj.surface(:,1),obj.surface(:,2),"LineStyle","-","Color","k", "LineWidth",3)
            exit=0;
        end
        function s=curvature(obj)
            top= [[obj.Position(1)-obj.Thickness/2;obj.Position(1)+obj.Thickness/2] [obj.Position(2)+obj.Radius;obj.Position(2)+obj.Radius]];
            top
            surface1=CircSurf(obj.Position,obj.Rc1,top(1,:));
            surface2=CircSurf(obj.Position,-obj.Rc2,top(2,:));
            bottom=[[obj.Position(1)-obj.Thickness/2;obj.Position(1)+obj.Thickness/2] [obj.Position(2)-obj.Radius;obj.Position(2)-obj.Radius]];
            s=[surface1; flip(top); flip(surface2); bottom];
        end
    end
end