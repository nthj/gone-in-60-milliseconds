# Further Resources

## Alternatives

* [actioncable-js](https://github.com/mwalsher/actioncable-js/)

## Gotchas
* [Puma unresponsive when there is more than one ActionCable channel](https://github.com/rails/rails/issues/25117)

## Deployment
* [Integrating Action Cable with Passenger Standalone](https://www.phusionpassenger.com/library/config/standalone/action_cable_integration/)
* [Deploying ActionCable to Heroku](http://www.thegreatcodeadventure.com/deploying-action-cable-to-heroku/) via @SophieDeBenedetto

## Performance 
* [Action Cable - Friend or Foe?](https://www.nateberkopec.com/2015/09/30/action-cable.html)
* [Musings on HTTP/2 integration via @tenderlove on GitHub](https://github.com/tenderlove/the_metal/issues/5)
* [What HTTP/2 means for Ruby developers](https://www.nateberkopec.com/2016/01/07/what-http2-means-for-ruby-developers.html) is also nice

## Examples of Authentication

```
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end

    def ability
      @ability ||= Ability.new(current_user)
    end

    protected
    def find_verified_user
      User.find_by(id: session["user_id"])
    end
  end
end
```

and

```
module ApplicationCable
  class Channel < ActionCable::Channel::Base
    delegate :session, :ability, to: :connection
    # dont allow the clients to call those methods
    protected :session, :ability
  end
end
```

## Questions 

Hey, I'm [@thenthj](https://twitter.com/thenthj) on Twitter.

## Acknowledgements

Thanks to [@austinonrails](https://twitter.com/austinonrails) for having me on May 24th, 2016. :) 
