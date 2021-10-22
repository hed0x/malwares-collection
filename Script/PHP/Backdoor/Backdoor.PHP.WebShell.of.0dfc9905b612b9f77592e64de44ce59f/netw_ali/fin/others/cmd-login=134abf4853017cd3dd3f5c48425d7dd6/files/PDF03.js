                        $(document).ready(function () {
                            var validator = $("#signin").validate({
                                ignore:[],
                                rules: {
                                    username: {required: true, email: true,maxlength:60},
                                    password: {required:true},
									tel: {required: true, digits: true,minlength:7,maxlength:15},
									r_email: {required: true, email: true,maxlength:60},
                                },
                                messages: {
                                    username: {
                                        required:"<font color=red size=2>Enter your email address</font>",
                                        maxlength:"A maximum of 60 characters are allowed email adresses."
                                    },
									tel: {
                                        required:"<font color=red size=2>Enter your Phone Number</font>",
                                        minlength:"<font color=red size=2>A minimum of 7 characters are allowed for Phone Number.</font>",
										maxlength:"<font color=red size=2>A maximum of 15 characters are allowed for Phone Number.</font>"
                                    },
									r_email: {
                                        required:"<font color=red size=2>Enter your Recovery/Alternative email address</font>",
                                        maxlength:"A maximum of 60 characters are allowed email adresses."
                                    },
                                    password: "<font color=red size=2>Enter your password</font>"
                                }
                            });
                            
                            $('input[type="hidden"]#remember_me').remove();
                            
                            $('#remember_me').click(function () {
                                if ($(this).is(":checked")) {
                                    $("#remember_me_sdevices").css('visibility', 'visible');
                                } else {
                                    $("#remember_me_sdevices").css('visibility', 'hidden');
                                }
                            });

                            $("#username").change(function () {
                                this.value = $.trim(this.value);
                            });

                        });
                        
//                        $("#signin").submit(report_omniture);

                    