`timescale 1ns / 1ps

module elevator(

input clk_50hz, rst,

floor_0_p,
floor_1_p,
floor_2_p,
floor_3_p,
floor_4_p,

direction_1,
direction_2,
direction_3,

floor_0_d,
floor_1_d,
floor_2_d,
floor_3_d,
floor_4_d,

output  led_inside_0,
led_inside_1,
led_inside_2,
led_inside_3,
led_inside_4,

led_outside_0,
led_outside_1,
led_outside_2,
led_outside_3,
led_outside_4,

led_busy,

reg [7:0] a,b,c,d,e,f,g,p
);
reg led_busy_reg=0;
assign led_busy = led_busy_reg; 
	reg [4:0]Lig_All=0;
	
    reg [4:0]Elev_Put=0;
    
	
	reg PosLoc=1;
	
	reg [2:0] regression=0;
    
    assign led_inside_0 =Lig_All[0];
	
    assign led_inside_1 =Lig_All[1]; 
    
	assign led_inside_2 =Lig_All[2]; 
    
	assign led_inside_3 =Lig_All[3]; 
    
	assign led_inside_4 =Lig_All[4]; 
    reg Current_way=0,way_want=0,push_button=0;
	reg [9:0] Say=0;
	reg Layer1,Layer2,Layer3,Layer4,Layer5;
    reg [2:0] pressed=7,Inner_Me=7,DirMe=7,FinishPart=7;
    
    assign led_outside_0 = Elev_Put[0];
	
    assign led_outside_1 = Elev_Put[1]; 
    
	assign led_outside_2 = Elev_Put[2]; 
    
	assign led_outside_3 = Elev_Put[3]; 
    
	assign led_outside_4 = Elev_Put[4]; 
    reg first;
    always @ (posedge clk_50hz)
        begin
            if(rst==0) 
                begin
					first<=0;
					led_busy_reg<=0;
					Lig_All<=0;
					Elev_Put<=0;
                    push_button<=0;
                    Inner_Me<=7;
					PosLoc<=1;
                    Current_way<=0;
                    DirMe<=7;
                    FinishPart<=7;
                    regression<=0;
                    way_want<=0;
                    Say<=1;
                    pressed<=7;
                    
                end
            else
                begin
                   	Layer1<=floor_0_d;
                    Layer2<=floor_1_d;
                    Layer3<=floor_2_d;
                    Layer4<=floor_3_d;
                    Layer5<=floor_4_d;
					
					
					p<=8'b11111111;
					

					a[7]<=1;
					b[7]<=1;
					c[7]<=1;
					d[7]<=1;
					a[6]<=1;
					b[6]<=1;
					c[6]<=1;
					d[6]<=1;
					e[6]<=1;
					f[6]<=1;
					g[6]<=0;
					e[7]<=1;
					f[7]<=1;
					g[7]<=0;

					
					
					if(PosLoc)
					   begin
                            a[5]<=1;
                            b[5]<=0;
                            c[5]<=0;
                            d[5]<=1;
                            e[5]<=1;
                            f[5]<=1;
                            g[5]<=1;					   
					   end
					else if(Current_way) 
					   begin
                            a[5]<=1;
                            b[5]<=0;
                            c[5]<=0;
                            d[5]<=0;
                            e[5]<=0;
                            f[5]<=1;
                            g[5]<=0;					   
					   end	
					else
					   begin
                            a[5]<=1;
                            b[5]<=0;
                            c[5]<=0;
                            d[5]<=0;
                            e[5]<=0;
                            f[5]<=0;
                            g[5]<=1;					   
					   end						   


					 if(PosLoc)
					   begin
                            a[4]<=1;
                            b[4]<=0;
                            c[4]<=0;
                            d[4]<=0;
                            e[4]<=0;
                            f[4]<=1;
                            g[4]<=0;					   
					   end							
					 else if(Current_way)
					   begin
                            a[4]<=0;
                            b[4]<=0;
                            c[4]<=0;
                            d[4]<=0;
                            e[4]<=0;
                            f[4]<=0;
                            g[4]<=1;					   
					   end									
				    else 
					   begin
                            a[4]<=0;
                            b[4]<=0;
                            c[4]<=1;
                            d[4]<=1;
                            e[4]<=0;
                            f[4]<=0;
                            g[4]<=0;					   
					   end
					a[3]<=0;
					b[3]<=1;
					c[3]<=1;
					d[3]<=1;
					e[3]<=0;
					f[3]<=0;
					g[3]<=0;
					
					a[2]<=1;
					b[2]<=1;
					c[2]<=1;
					d[2]<=0;
					e[2]<=0;
					f[2]<=0;
					g[2]<=1;					
					

					a[1]<=1;
					b[1]<=1;
					c[1]<=1;
					d[1]<=1;
					e[1]<=1;
					f[1]<=1;
					g[1]<=0;					
					
					if(regression==0)
					   begin
                            a[0]<=0;
                            b[0]<=0;
                            c[0]<=0;
                            d[0]<=0;
                            e[0]<=0;
                            f[0]<=0;
                            g[0]<=1;						   
					   end
					else if(regression==1)
					   begin
                            a[0]<=1;
                            b[0]<=0;
                            c[0]<=0;
                            d[0]<=1;
                            e[0]<=1;
                            f[0]<=1;
                            g[0]<=1;						   
					   end
					else if(regression==2)
					   begin
                            a[0]<=0;
                            b[0]<=0;
                            c[0]<=1;
                            d[0]<=0;
                            e[0]<=0;
                            f[0]<=1;
                            g[0]<=0;						   
					   end
					else if(regression==3)
					   begin
                            a[0]<=0;
                            b[0]<=0;
                            c[0]<=0;
                            d[0]<=0;
                            e[0]<=1;
                            f[0]<=1;
                            g[0]<=0;						   
					   end
					else
					   begin
                            a[0]<=1;
                            b[0]<=1;
                            c[0]<=0;
                            d[0]<=1;
                            e[0]<=1;
                            f[0]<=0;
                            g[0]<=0;						   
					   end					   					   					   					   
					   		
					   		
					   		
					   				    			
                    if(floor_0_p)
                        begin
							way_want<=0;
                            pressed<=0;
                        end
                    else if(floor_1_p)
                        begin
                            way_want<=direction_1;
							pressed<=1;
                        end                
                    else if(floor_2_p)
                        begin
                            way_want<=direction_2;
							pressed<=2;
                        end
                    else if(floor_3_p)
                        begin
							way_want<=direction_3;
                            pressed<=3;
                        end 
                    else if(floor_4_p)
                        begin
							way_want<=1;
                            pressed<=4;
                        end    
                    
                                       
                    if(floor_0_d==1 && Layer1==0 ) 
                        begin
							push_button<=1;
                            Inner_Me<=0;
                        end 
                    else if(floor_1_d==1 && Layer2==0 ) 
                        begin
							push_button<=1;
                            Inner_Me<=1;
                        end
                    else if(floor_2_d==1 && Layer3==0 ) 
                        begin
							push_button<=1;
                            Inner_Me<=2;
                        end
                    else if(floor_3_d==1 && Layer4==0 ) 
                        begin
							push_button<=1;
                            Inner_Me<=3;
                        end
                    else if(floor_4_d==1 && Layer5==0 ) 
                        begin
							push_button<=1;
                            Inner_Me<=4;
                        end                                                                        
                                                    
                    case(regression)
                        3'd0:
                            begin                  
                                if(Say<250)
                                    begin
                                        Say<=Say+1;
                                        
                                    end
                                else
                                    begin
										first<=0;
                                        pressed<=7;
                                        Say<=1;
                                        push_button<=0;
										DirMe<=7;
                                        if(pressed!=7 && pressed!=0) 
                                            begin
												regression<=regression+1;
                                                Current_way<=0;
                                                Elev_Put[pressed]<=1;
												PosLoc<=0;
                                                FinishPart<=pressed;   
                                                
                                            end     
                                        else if(push_button && Inner_Me!=0)
                                            begin
                                                Lig_All[Inner_Me]<=1;
												FinishPart<=Inner_Me;  
                                                regression<=regression+1;
                                                Current_way<=0;
												PosLoc<=0;
                                                
                                            end
										else
										  begin
											  PosLoc<=1;
											  Elev_Put[0]<=0;
										      Lig_All[0]<=0;
											if(first)
											 begin
											     led_busy_reg<=1;
											 end
											else
											     led_busy_reg<=0;
                                          end
                                    end
                            end
                        3'd1:
                            begin
								first<=1;
                                if(Say<250)
                                    begin
                                        Say<=Say+1;
                                        
                                    end
                                else
                                    begin       
                                        push_button<=0;
										Say<=1;
                                        pressed<=7;
										
                                        if(FinishPart==1 && PosLoc==0)    
                                            begin
												led_busy_reg<=1;
												PosLoc<=1;
												Elev_Put[1]<=0;
												FinishPart<=7;
												Lig_All[1]<=0;
												
                                            end

                                        else if(DirMe==1 && PosLoc==0)    
                                            begin
												led_busy_reg<=1;
                                                DirMe<=7;
												Elev_Put[1]<=0;
                                                Lig_All[1]<=0;
                                                
                                            end											
                                        else 
											begin
												led_busy_reg<=0;
												if(PosLoc==0)
													begin
														if(Current_way==0)
															regression<=regression+1;
														else
															regression<=regression-1;
													end
													
												if(pressed!=7 &&  pressed!=1) 
													begin
														if(PosLoc==1)
															begin
															    Elev_Put[pressed]<=1;
																FinishPart<=pressed;
																PosLoc<=0;
																DirMe<=7;
																
																if(pressed>1)
																	Current_way<=0;
																else
																	Current_way<=1;
																
															end
															
														else if(Current_way==0) 
															begin
																if(pressed<2) 
																    begin
																    
																    end
																else if(pressed<FinishPart && way_want ==Current_way)
																	begin
																	   DirMe<=pressed;
																	   Elev_Put[pressed]<=1;
																		
																		
																	end
																	
															end
														else
															begin
																
																	
															end                                                    
															
													end
												else if(push_button && Inner_Me!=1)
													begin
														if(PosLoc==1)
															begin
															    Lig_All[Inner_Me]<=1;
																FinishPart<=Inner_Me;
																PosLoc<=0;
																DirMe<=7;
																
																if(Inner_Me>1)
																	Current_way<=0;
																else
																	Current_way<=1;
																
															end													
														else if(Current_way==0)
															begin
																if(Inner_Me<2)
																    begin
																    
																    end
																else if(Inner_Me<FinishPart)
																    begin
																	   DirMe<=Inner_Me;
																	   Lig_All[Inner_Me]<=1;
																	   
																	end
															
															
															end
														else
															begin
																
															
															end
													
													end
											end
											
                                    
                                    
                                    end
                            
                            
                            end

                        3'd2:
                            begin
                                if(Say<250)
                                    begin
                                        Say<=Say+1;
                                        
                                    end
                                else
                                    begin   
                                        push_button<=0;
										Say<=1;
                                        pressed<=7;    
										
                                        if(FinishPart==2 && PosLoc==0)    
                                            begin
												led_busy_reg<=1;
                                                Lig_All[2]<=0;
												Elev_Put[2]<=0;
												FinishPart<=7;
												PosLoc<=1;
												
                                            end

                                        else if(DirMe==2 && PosLoc==0)    
                                            begin
												led_busy_reg<=1;
                                                Lig_All[2]<=0;
												DirMe<=7;
                                                Elev_Put[2]<=0;
                                                
                                            end											
                                        else 
											begin
												led_busy_reg<=0;
												if(PosLoc==0)
													begin
														if(Current_way==0)
															regression<=regression+1;
														else
															regression<=regression-1;
													end
													
												if(pressed!=7 &&  pressed!=2) 
													begin
														if(PosLoc==1)
															begin
															    Elev_Put[pressed]<=1;
																FinishPart<=pressed;
																PosLoc<=0;
																DirMe<=7;
																if(pressed>2)
																	Current_way<=0;
																else
																	Current_way<=1;
																
															end
															
														else if(Current_way==0) 
															begin
																if(pressed<3) 
																    begin
																    
																    end
																else if(pressed<FinishPart && way_want ==Current_way)
																	begin
																		DirMe<=pressed;
																	    Elev_Put[pressed]<=1;
																		
																		
																	end
																	
															end
														else
															begin

																if(pressed>=2) 
																    begin
																    
																    end
																else if(pressed>FinishPart && way_want ==Current_way)
																	begin
																		DirMe<=pressed;
																	   Elev_Put[pressed]<=1;
																		
																		
																	end
																																	
																	
															end                                                    
															
													end
												else if(push_button && Inner_Me!=2)
													begin
														if(PosLoc==1)
															begin
																FinishPart<=Inner_Me;
																PosLoc<=0;
															    Lig_All[Inner_Me]<=1;
																DirMe<=7;
																
																if(Inner_Me>2)
																	Current_way<=0;
																else
																	Current_way<=1;
																
															end													
														else if(Current_way==0) 
															begin
																if(Inner_Me<3)
																    begin
																    
																    end
																else if(Inner_Me<FinishPart)
																    begin
																		DirMe<=Inner_Me;
																	   Lig_All[Inner_Me]<=1;
																	   
															         end		
															
															
															end
														else
															begin
																if(Inner_Me>=2) 
																    begin
																    end
																else if(Inner_Me>FinishPart)
																	begin
																		Lig_All[Inner_Me]<=1;
																		DirMe<=Inner_Me;
																		
																	end
															
															end
													
													end
											end
											
                                    
                                    
                                    end
                            
                            
                            end				

                        3'd3:
                            begin
                                if(Say<250)
                                    begin
                                        Say<=Say+1;
                                        
                                    end
                                else
                                    begin  
                                        push_button<=0;  
                                        pressed<=7;   
										Say<=1;
                                        if(FinishPart==3 && PosLoc==0)    
                                            begin
												led_busy_reg<=1;
												PosLoc<=1;
												Elev_Put[3]<=0;
												FinishPart<=7;
												Lig_All[3]<=0;
												
                                            end

                                        else if(DirMe==3 && PosLoc==0)    
                                            begin
												led_busy_reg<=1;
                                                Lig_All[3]<=0;
												DirMe<=7;
                                                Elev_Put[3]<=0;
                                                
                                            end											
                                        else 
											begin
												led_busy_reg<=0;
												if(PosLoc==0)
													begin
														if(Current_way==0)
															regression<=regression+1;
														else
															regression<=regression-1;
													end
													
												if(pressed!=7 &&  pressed!=3)
													begin
														if(PosLoc==1)
															begin
															    Elev_Put[pressed]<=1;
																FinishPart<=pressed;
																PosLoc<=0;
																DirMe<=7;
																
																if(pressed>3)
																	Current_way<=0;
																else
																	Current_way<=1;
																
															end
															
														else if(Current_way==0) 
															begin
												
																	
															end
														else
															begin

																if(pressed>=3) 
																    begin
																    end
																    
																else if(pressed>FinishPart && way_want ==Current_way)
																	begin
																		DirMe<=pressed;
																	    Elev_Put[pressed]<=1;
																		
																		
																	end
																																	
																	
															end                                                    
															
													end
												else if(push_button && Inner_Me!=3)
													begin
														if(PosLoc==1)
															begin
																FinishPart<=Inner_Me;
																PosLoc<=0;
															    Lig_All[Inner_Me]<=1;
																DirMe<=7;
																
																if(Inner_Me>3)
																	Current_way<=0;
																else
																	Current_way<=1;
																
															end													
														else if(Current_way==0)
															begin

															
															end
														else
															begin
																if(Inner_Me>=3)
																    begin
																    
																    end
																else if(Inner_Me>FinishPart)
																	begin
																		DirMe<=Inner_Me;
																	   Lig_All[Inner_Me]<=1;
																		
																		
																	end
															
															end
													
													end
											end
											
                                    
                                    
                                    end
                            
                            
                            end				
             
                
                

                        3'd4:
                            begin
                                if(Say<250)
                                    begin
                                        Say<=Say+1;
                                        
                                    end
                                else
                                    begin   
                                        push_button<=0; 
                                        pressed<=7;   
										Say<=1;
                                        if(FinishPart==4 && PosLoc==0)    
                                            begin
												led_busy_reg<=1;
                                                FinishPart<=7;
												Lig_All[4]<=0;
												Elev_Put[4]<=0;
												PosLoc<=1;
												
                                            end

                                        else if(DirMe==3 && PosLoc==0)    
                                            begin
												led_busy_reg<=1;
												DirMe<=7;
                                                Lig_All[4]<=0;
                                                Elev_Put[4]<=0;
                                                
                                            end											
                                        else 
											begin
												led_busy_reg<=0;
												if(PosLoc==0)
													begin
														regression<=regression-1;
													end
													
												if(pressed!=7 &&  pressed!=4)
													begin
														if(PosLoc==1)
															begin
																FinishPart<=pressed;
																PosLoc<=0;
															    Elev_Put[pressed]<=1;
																DirMe<=7;
																

																Current_way<=1;
																
															end
															
														else if(Current_way==0) 
															begin
												
																	
															end
														else
															begin

																if(pressed>FinishPart && way_want ==Current_way)
																	begin
																		DirMe<=pressed;
																	    Elev_Put[pressed]<=1;
																		
																		
																	end
																																	
																	
															end                                                    
															
													end
												else if(push_button && Inner_Me!=4)
													begin
														if(PosLoc==1)
															begin
																FinishPart<=Inner_Me;
																PosLoc<=0;
															   Lig_All[Inner_Me]<=1;
																DirMe<=7;
																

																Current_way<=1;
																
															end													
														else if(Current_way==0)
															begin

															
															end
														else
															begin
																if(Inner_Me>FinishPart)
																	begin
																		Lig_All[Inner_Me]<=1;
																		DirMe<=Inner_Me;
																		
																	end
															
															end
													
													end
											end
											
                                    
                                    
                                    end
                            
                            
                            end				            
              
                endcase
                                
                
                
                
                
                
                
                end

        
        
        end
    
    
    
    
    
    
    
    
    
    
    
endmodule
