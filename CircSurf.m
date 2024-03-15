function curve=CircSurf(pos, Rc, point)
    point = point-pos;
    point
    CentCurv=point(1)+sign(Rc)*(Rc^2-point(2)^2)^0.5;
    y_lens=linspace(-point(2),point(2),100)';
    circularSurface=CentCurv-sign(Rc)*(Rc^2-y_lens.^2).^0.5;
    curve=[circularSurface y_lens]+pos;
end