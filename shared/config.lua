WEX = {}

WEX.Debug = false

WEX.WineJob = "wine"

WEX.Blips = {
    {  
    coords = vector3(-1897.4508, 2068.5034, 140.9111),
    Name = "WineYard",
    ID = 93,
    Scale = 1.0,
    Colour = 27,
}
}


WEX.Garage = {
        location = 'Wine Garage',
        pedModel = 'a_m_y_business_02',
        targetLabel = "Open garage",
        menuLabel = "Wine Garage",
        pedCoords = vector4(-1898.9642, 2054.2561, 139.8796, 161.4845),
        vehSpawnPos = vector4(-1904.6429, 2055.7778, 140.7345, 159.4937),
        vehDeletePos = vector3(-1904.6429, 2055.7778, 140.7345),
        cars = {
            {
                carLabel = "PickUp",
                carSpawnCode = "rebel2"
            },
            {
                carLabel = "SUV",
                carSpawnCode = "baller3"
            }
        }
}

WEX.CollectPos = {
    {
        position = vec3(-1876.4037, 2099.1504, 139.7357),
        item = "red_wine_grapes",
        getMin = 2,
        getMax = 7,
        TargetLabel = "Prune the red wine bush",
        duration = 3000,
        ProgressLabel = "collecting grapes...",
        dict = 'missmechanic',
        clip = 'work2_base'
    },
    {
        position = vec3(-1881.6556, 2099.4763, 139.7973),
        item = "white_wine_grapes",
        getMin = 2,
        getMax = 7,
        TargetLabel = "Prune the white wine bush",
        duration = 3000,
        ProgressLabel = "collecting grapes...",
        dict = 'missmechanic',
        clip = 'work2_base'
    },
}

WEX.WinepressPos = {
    {
        position = vec3(-1931.8302, 2058.1914, 140.5593),
        needItem = "red_wine_grapes",
        getItem = "red_wine_juice",
        needMin = 1,
        needMax = 6,
        getMin = 1,
        getMax = 1,
        TargetLabel = "Crush red wine",
        duration = 3000,
        ProgressLabel = "crushing grapes...",
        dict = 'missmechanic',
        clip = 'work2_base'
    },
    {
        position = vec3(-1932.4402, 2055.4668, 140.5403),
        needItem = "white_wine_grapes",
        getItem = "white_wine_juice",
        needMin = 1,
        needMax = 6,
        getMin = 1,
        getMax = 1,
        TargetLabel = "Crush white wine",
        duration = 3000,
        ProgressLabel = "crushing grapes...",
        dict = 'missmechanic',
        clip = 'work2_base'
    }
}

WEX.WineTransferring = {
    {
        position = vec3(-1868.2888, 2058.8057, 140.9796),
        needItem = "red_wine_juice",
        getItem = "red_wine_bottle",
        needMin = 1,
        needMax = 1,
        getMin = 2,
        getMax = 7,
        TargetLabel = "Fill a bottle of red wine",
        duration = 3000,
        ProgressLabel = "Pouring wine...",
        dict = 'missmechanic',
        clip = 'work2_base'
    },
    {
        position = vec3(-1868.2084, 2055.9861, 140.9599),
        needItem = "white_wine_juice",
        getItem = "white_wine_bottle",
        needMin = 1,
        needMax = 1,
        getMin = 2,
        getMax = 7,
        TargetLabel = "Fill a bottle of white wine",
        duration = 3000,
        ProgressLabel = "Pouring wine...",
        dict = 'missmechanic',
        clip = 'work2_base'
    }
}
