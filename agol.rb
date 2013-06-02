require_relative './lib/curses_controller'
require_relative './lib/cell'
require_relative './lib/universe'

CursesController.new().tap do |curses|
  STATUS_FORMAT = "1-9=init grid, q=quit, c=change color, any other key = cycle [%d cells alive]"
  color = 0
  curses.status  STATUS_FORMAT % 0
  universe=Universe.new(0,0)
  color = 1
  loop do
    chr = Curses.getch
    case chr
    when ?q
      break
    when /\d/
      curses.clear
      universe = Universe.new( chr.to_i*9, chr.to_i*9 )
    when ?c
      color = rand(65).to_i
    else
      universe.cycle
    end
    curses.print_screen universe.output.map{|row| row.join(' ')+' |' }+['-'*universe.width*2], color
    curses.status STATUS_FORMAT % universe.cells_alive
  end
end

