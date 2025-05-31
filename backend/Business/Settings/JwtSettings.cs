﻿using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace Business.Settings;

public class JwtSettings
{
    public required string Secret { get; init; }
    public required string Issuer { get; init; }
    public required string Audience { get; init; }
    public int AccessTokenExpirationInMinutes { get; init; }
    public SymmetricSecurityKey GetSymmetricSecurityKey() => new(Encoding.UTF8.GetBytes(Secret));
}