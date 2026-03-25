void HexGrid_float(float2 GridUV, out float HexDistance, out float2 CellID){
    float2 s = float2(1.0, 1.7320508);
    float4 s_xyxy = float4(s.x, s.y, s.x, s.y);
    float4 h = float4(GridUV.x, GridUV.y, GridUV.x - s.x * 0.5, GridUV.y - s.y * 0.5);
    float4 iC = floor(h / s_xyxy) + 0.5;
    h -= iC * s_xyxy;

    float4 hexCoords;
    if (dot(h.xy, h.xy) < dot(h.zw, h.zw)) {
        hexCoords = float4(h.xy, iC.xy);
    } else {
        hexCoords = float4(h.zw, iC.zw + 0.5);
    }

    float2 p = abs(hexCoords.xy);
    HexDistance = max(dot(p, s * 0.5), p.x);
    CellID = hexCoords.zw;
}