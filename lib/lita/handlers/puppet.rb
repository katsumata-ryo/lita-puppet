module Lita
  module Handlers
    class Puppet < Handler
      route(
        /^puppet\s+(.{1,})\s+(.{1,})$/,
        :puppet,
        help: { "puppet <room_name> <message>" => "messageをroomにパペットマペット" }
      )

      def puppet(response)
        room_name = response.matches[0][0]
        message = response.matches[0][1]
        room = Lita::Room.find_by_name("#{room_name}")
        target_room = Lita::Source.new(room: room)

        robot.send_message(target_room, message)
      end

      Lita.register_handler(self)
    end
  end
end
