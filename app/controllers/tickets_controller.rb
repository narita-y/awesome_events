class TicketsController < ApplicationController
  before_action :authenticate

  def new
    raise ActionController::RoutingError, 'ログイン状態で TicketsController#new にアクセス'
  end

  def create

    p 'aaaa'
    ticket = current_user.tickets.build do | t |
      t.event_id = params[ :event_id ]
      t.comment = params[ :ticket ][ :comment ]
    end
    p 'bbbb'
    if ticket.save
      flash[ :notice ] = 'このイベントに参加表明しました'
      head 201
    else
      p 'cccc'
      p ticket.errors.full_messages
      render json: { messages: ticket.errors.full_messages }, status: 422
    end
  end
end
