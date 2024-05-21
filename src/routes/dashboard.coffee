{ Router } = require "@antibot/server"
router = Router()

router.get "/dashboard", (req, res) ->
    data = {}
    if req.session.user
        if req.cookies.userid and req.cookies.username and req.cookies.avatarid
            data = userid : req.cookies.userid, username : req.cookies.username, avatarid : req.cookies.avatarid
            res.render "dashboard", data...
        else
            if req.cookies.userid and req.cookies.username and req.cookies.avatarid
                 data = userid : req.cookies.userid, username : req.cookies.username, avatarid : req.cookies.avatarid
                 res.render "dashboard", data...
            res.render "dashboard", userid : req.session.user.userid, username : req.session.user.username, avatarid : req.session.user.avatarid
    else 
        res.redirect "/login"

exports.default = router
