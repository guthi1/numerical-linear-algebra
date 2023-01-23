using Random, Distributions, Plots
Random.seed!(123) # Setting the seed

NB_DAY = 20
DATA_POINT = 24 * NB_DAY    # In days
VAR_YEAR = 25               # Var in a day year
VAR_DAY = 5                 # Var in a day
μ = 10                      # Measure noise mean
σ = 1                       # Measure noise var

function genTimeSeries()
    # Generate data from noise
    data = rand(Normal(μ, σ), DATA_POINT)
    noise = Normal(0, 0.1)
    hour = 1
    day = 1

    # Generate time series from data
    for i in range(1, length(data))

        # Gen day variation
        hour_var = VAR_DAY * (sin((hour / 12) * π) + rand(noise))
        # Gen season variation
        day_var = VAR_YEAR * (sin((day / 180) * π) + rand(noise))
        # Gen other variation
        # ...

        # Let's add a trend over time
        data[i] += hour_var + day_var + (i / 1000)


        # Update time
        hour = (hour + 1) % 24
        if hour == 0
            day = (day + 1) % 360
        end

    end
    return data
end


data = genTimeSeries()
plot(data, title="Time series generation", label=["Leo's house"])
ylabel!("kWh")
xlabel!("hours from november 1st")
savefig("sample.png")
