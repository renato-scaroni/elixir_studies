defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """

    # Earth: orbital period 365.25 Earth days, or 31557600 seconds
    # Mercury: orbital period 0.2408467 Earth years
    # Venus: orbital period 0.61519726 Earth years
    # Mars: orbital period 1.8808158 Earth years
    # Jupiter: orbital period 11.862615 Earth years
    # Saturn: orbital period 29.447498 Earth years
    # Uranus: orbital period 84.016846 Earth years
    # Neptune: orbital period 164.79132 Earth years

  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_years = seconds/31557600
    case planet do
      :earth -> earth_years
      :mercury -> earth_years / 0.2408467
      :venus -> earth_years / 0.61519726
      :mars -> earth_years / 1.8808158
      :jupiter -> earth_years / 11.862615
      :saturn -> earth_years / 29.447498
      :uranus -> earth_years / 84.016846
      :neptune -> earth_years / 164.79132
    end
  end
end
