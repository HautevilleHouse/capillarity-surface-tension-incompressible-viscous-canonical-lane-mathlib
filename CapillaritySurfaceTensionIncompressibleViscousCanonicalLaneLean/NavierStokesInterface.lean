import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscous

structure NavierStokesInterface where
  fluidDomain : Type u
  velocityField : Type v
  pressureField : Type w
  incompressibilityConstraint : Prop
  viscousStressTensor : Prop
  noSlipBoundaryCondition : Prop
  incompressibilityConstraintClosed : incompressibilityConstraint
  viscousStressTensorClosed : viscousStressTensor
  noSlipBoundaryConditionClosed : noSlipBoundaryCondition

structure NavierStokesInterfaceEvidence (N : NavierStokesInterface) where
  incompressibilityConstraintClosed : N.incompressibilityConstraint
  viscousStressTensorClosed : N.viscousStressTensor
  noSlipBoundaryConditionClosed : N.noSlipBoundaryCondition

def NavierStokesInterfaceClosed (N : NavierStokesInterface) : Prop :=
  N.incompressibilityConstraint ∧ N.viscousStressTensor ∧ N.noSlipBoundaryCondition

theorem navier_stokes_interface_closed_from_evidence
    (N : NavierStokesInterface) (E : NavierStokesInterfaceEvidence N) :
    NavierStokesInterfaceClosed N := by
  exact And.intro E.incompressibilityConstraintClosed
    (And.intro E.viscousStressTensorClosed E.noSlipBoundaryConditionClosed)

end CapillaritySurfaceTensionIncompressibleViscous
end HautevilleHouse