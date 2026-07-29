import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillarySurfacePDEPackage where
  fluidDomain : Type u
  interfaceShape : Type v
  curvatureOperator : Type w
  stressJumpCondition : Prop
  capillaryEquation : Prop
  boundaryConditions : Prop

structure CapillarySurfacePDEEvidence (P : CapillarySurfacePDEPackage) where
  stressJumpConditionClosed : P.stressJumpCondition
  capillaryEquationClosed : P.capillaryEquation
  boundaryConditionsClosed : P.boundaryConditions

def CapillarySurfacePDEClosed (P : CapillarySurfacePDEPackage) : Prop :=
  P.stressJumpCondition ∧ P.capillaryEquation ∧ P.boundaryConditions

theorem capillary_surface_pde_closed_from_evidence (P : CapillarySurfacePDEPackage)
    (E : CapillarySurfacePDEEvidence P) : CapillarySurfacePDEClosed P := by
  exact And.intro E.stressJumpConditionClosed
    (And.intro E.capillaryEquationClosed E.boundaryConditionsClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse