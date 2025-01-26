Declare @age datetime = '2004-07-25'

	select floor((datediff(day,'0001-01-01',getdate()) - datediff(day,'0001-01-01',@age)) / 365.25) as 'year',
           floor(((datediff(day,'0001-01-01',getdate()) - datediff(day,'0001-01-01',@age)) % 365.25)/30.4375) as 'month',
           floor(((datediff(day,'0001-01-01',getdate()) - datediff(day,'0001-01-01',@age)) % 365.25)%30.4375) as 'day'

