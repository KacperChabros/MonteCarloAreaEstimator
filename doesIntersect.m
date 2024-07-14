function [intersection] = doesIntersect(A, B, C, D)
%doesIntersect checks if two line segments AB and CD intersect.
%A, B, C, D are points -> two-element vector: [x, y]
    intersection=false;
    vp1=vectorProduct(A,B,C);
    vp2=vectorProduct(A,B,D);

    vp3=vectorProduct(C,D,A);
    vp4=vectorProduct(C,D,B);

    if((vp1>0&&vp2<0||vp1<0&&vp2>0)&&(vp3>0&&vp4<0||vp3<0&&vp4>0)) %the lines intersect
        intersection=true;
        return
    end

    % vP=0 -> 3 points are collinear -> need to check if the end
    % of one segment lies on the other
    if( vp1 == 0 && liesOnSegment(A,B,C))
        intersection=true;
        return
    end
    if( vp2 == 0 && liesOnSegment(A,B,D))
        intersection=true;
        return
    end
    if( vp3 == 0 && liesOnSegment(C,D,A))
        intersection=true;
        return
    end
    if( vp4 == 0 && liesOnSegment(C,D,B))
        intersection=true;
        return
    end
end

