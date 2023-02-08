# Terraform VPC Automation
# Create a VPC step by step in GUI

- Select a region where you want your VPC to be create.

First, you need to create your custom vpc. Then you can chunk your CIDR with public and private Ips address subnetThat doesn’t mean they public or private it just subnets but you will need to associate them with route-table also called public and private. Public subnets should be with public-route-table and private subnets with private-route-table.  

Route-table is the distributer that distribute internet to your subnets.  

Next, you will need to create Internet Gateway to have your route-table internet.  After you create Internet Getaway you need to attach to your vpc. Internet Gateway goes to public subnet only, traffics public.   

Then, you need add route-table to your Internet Gateway.  

Int Gateway, knows as Ingress and Egress. 

Nat Gateway, knows as Egress only. Nat gateway use elastic ip address only.  

Allocate elastic ip if you don’t have it, because Nat Gateway works with elastic ip. 

Once you have Nat Gateway you need to go to route table and click on routes and add rout-to your Nat Gateway.  

To check connection on private subnet we can create private instance and make sure instance is create on private subnet.  

To check If your instance has internet, you can just create Instance, make sure on your vpc, public subnet and enable your ip address.  

To have internet in private instance you need to create Nat Gateway. Nat ‘gateway never connect to internet gateway always connect to public subnet to the one you specified.  