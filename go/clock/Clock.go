package clock

import "fmt"

const (
	minutesInHour = 60
	hoursInDay    = 24
	minutesInDay  = hoursInDay * minutesInHour
	TestVersion   = 1
)

type Clock struct {
	h int
	m int
}

func New(h, m int) Clock {
	cH, cM := minutesToHoursMinutes(h*minutesInHour + m)
	return Clock{h: cH, m: cM}
}

func (c Clock) Add(addMinutes int) Clock {
	c.h, c.m = minutesToHoursMinutes(c.h*minutesInHour + c.m + addMinutes)
	return c
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.h, c.m)
}

func minutesToHoursMinutes(totalMinutes int) (h int, m int) {
	dayAdjusted := totalMinutes % minutesInDay
	if dayAdjusted < 0 {
		dayAdjusted = minutesInDay + dayAdjusted
	}
	return (dayAdjusted / minutesInHour), (dayAdjusted % minutesInHour)
}
